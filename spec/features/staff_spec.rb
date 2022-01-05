require 'rails_helper'

feature "staff", type: :feature do
    feature "ユーザー登録と削除" do
        scenario "ユーザー登録できること" do
            visit root_path
            expect(page).to have_content("ようこそCramAppへ！")
            find("#staff_login").click
            find("#staff_signup").click
            fill_in "staff_member_family_name", with: "Test"
            fill_in "staff_member_given_name", with: "Staff"
            fill_in "staff_member_family_name_kana", with: "テスト"
            fill_in "staff_member_given_name_kana", with: "スタッフ"
            select "男性", from: "性別"
            select "2000", from: "staff_member[birthday(1i)]"
            select "11", from: "staff_member[birthday(2i)]"
            select "5", from: "staff_member[birthday(3i)]"
            fill_in "staff_member_email", with: "test_staff@example.com"
            select "アルバイト", from: "staff_member_employment_status"
            fill_in "staff_member_password", with: "password"
            fill_in "staff_member_password_confirmation", with: "password"
            click_button "登録"
            expect(page).to have_content "ようこそ、Test Staffさん!"
        end

        scenario "ユーザー削除できること" do
            visit staff_login_path
            fill_in "session_email", with: "test_staff@example.com"
            fill_in "session_password", with: "password"
            click_button "ログイン"
            click_on "ユーザー情報"
            click_on "削除"
            expect {
                expect(page.driver.browser.switch_to.alert.text).to eq "ユーザー「Test Staff」を削除します。本当によろしいですか？"
                page.driver.browser.switch_to.alert.accept
                expect(page).to have_content "ユーザーを削除しました"
            }
        end
    end

    feature "ユーザー登録後" do

        feature "ログイン失敗時" do
            scenario "ログインが失敗すること" do
                visit staff_login_path
                fill_in "session_email", with: "taro@example.com"
                fill_in "session_password", with: "xxxxxxxx"
                click_button "ログイン"
                expect(page).to have_content "メールアドレスまたはパスワードが正しくありません"
            end
        end

        feature "ログイン成功時" do
            background "ログインできること" do
                visit staff_login_path
                fill_in "session_email", with: "taro@example.com"
                fill_in "session_password", with: "password"
                click_button "ログイン"
                expect(page).to have_content "ログインしました。ようこそ 山田 太郎 さん!"
            end

            scenario "お知らせを確認できること" do
                click_on "お知らせ一覧"
                first("#show_post").click
                find(:css, "#target_content")
                click_on "一覧"
                expect(page).to have_content "お知らせ一覧"
            end

            scenario "お知らせを投稿できること" do
                click_on "お知らせ投稿"
                fill_in "タイトル", with: "テストのお知らせタイトル"
                fill_in "本文", with: "テストのためのお知らせ本文です。お知らせ内容や詳細をここに記載します。"
                check "重要事項ならチェック:"
                select "山田 太郎", from: "投稿者"
                click_on "投稿"
                expect(page).to have_content "お知らせを投稿しました"
            end

            scenario "お知らせを編集できること" do
                click_on "お知らせ一覧"
                first("#show_post").click
                click_on "編集"
                click_on "更新"
                expect(page).to have_content "投稿を更新しました"
            end

            scenario "お知らせを削除できること" do
                click_on "お知らせ一覧"
                first("#show_post").click
                click_on "削除"
                expect {
                    page.driver.browser.switch_to.alert.accept
                    expect(page).to have_content "投稿を削除しました"
                }
            end

            scenario "デイリーシートを確認できること" do
                click_on "デイリーシート一覧"
                first(:link, "表示").click
                expect(page).to have_content "テキスト"
                click_on "一覧"
                expect(page).to have_link "表示"
            end

            feature "イベントに関連づいたデイリーシート" do
                scenario "通常授業を作成できること" do
                    visit new_staff_event_path
                    choose "js-ordinary_type"
                    select "田中 一郎", from: "event_student_member_id"
                    select "山田 太郎", from: "event_staff_member_id"
                    fill_in "js-period_form", with: "3"
                    select "高校英語", from: "event_subject_id"
                    fill_in "js-start_time_form", with: "18:20"
                    fill_in "js-end_time_form", with: "19:20"
                    fill_in "js-title_form", with: "3限英語"
                    click_on "登録"
                    expect(page).to have_content "新たに予定を登録しました"
                end

                scenario "デイリーシートを作成できること" do
                    event = Event.last
                    visit staff_event_path(event)
                    click_on "デイリーシート作成"
                    select "田中 一郎", from: "daily_sheet_student_member_id"
                    fill_in "daily_sheet_study_date", with: Date.today
                    fill_in "daily_sheet_period_id", with: "1"
                    select "中学理科", from: "daily_sheet_subject_id"
                    select "中三理科問題集", from: "daily_sheet_textbook_id"
                    fill_in "daily_sheet_message", with: "テストのメッセージです。"
                    fill_in "daily_sheet_information", with: "テストのための連絡事項です。"
                    choose "daily_sheet_participation_attendant"
                    click_on "作成"
                    expect(page).to have_content "登録しました"
                end

                scenario "デイリーシートを確認・削除できること" do
                    event = Event.last
                    visit staff_event_path(event)
                    click_on "デイリーシート確認"
                    click_on "削除"
                    expect {
                        page.driver.browser.switch_to.alert.accept
                        expect(page).to have_content "シートを削除しました"
                    }
                end
            end

            scenario "点数表を確認できること" do
                click_on "点数表"
                first(:link, "表示する").click
                expect(page).to have_content "点数"
                click_on "一覧"
                expect(page).to have_link "表示する"
            end

            scenario "テストの詳細を確認できること" do
                click_on "点数表"
                first(:link, "表示する").click
                click_on "このテストの情報を確認する"
                expect(page).to have_content "科目別"
            end

            scenario "予定表を確認できること" do
                click_on "予定表"
                expect(current_path).to eq staff_events_path
                # 本当はカレンダーが表示されていることをテストしたかった
                # selenium/standalone-chromeがm1macで使えない？
            end



            scenario "予約型の授業を追加できること" do
                visit new_staff_event_path
                choose "js-reservation_type"
                select "山田 太郎", from: "event_staff_member_id"
                fill_in "js-period_form", with: "3"
                select "高校英語", from: "event_subject_id"
                fill_in "js-start_time_form", with: "18:20"
                fill_in "js-end_time_form", with: "19:20"
                fill_in "js-title_form", with: "3限講習"
                click_on "登録"
                expect(page).to have_content "新たに予定を登録しました"
            end

            scenario "テキストを確認・登録・削除できること" do
                click_on "テキスト"
                click_on "新規登録"
                fill_in "textbook_name", with: "テストテキスト"
                select "教科書", from: "textbook_text_type"
                select "中学英語", from: "textbook_subject_id"
                click_on "作成"
                expect(page).to have_content "テキストを登録しました"
                first(:link, "削除").click
                expect {
                    page.driver.browser.switch_to.alert.accept
                    expect(page).to have_content "テキストを削除しました"
                }
            end

            scenario "教室情報を確認できること" do
                click_on "教室情報"
                expect(page).to have_content "住所:"
            end

            scenario "ユーザー情報を確認できること" do
                click_on "ユーザー情報"
                click_on "編集"
                expect(page).to have_content "性"
                click_on "更新"
                expect(page).to have_content "ユーザー情報を更新しました"
            end

            scenario "使い方を確認できること" do
                click_on "使い方"
                expect(page).to have_content "CramAppの使い方(講師)"
            end

            scenario "ログアウトできること" do
                click_on "ログアウト"
                expect {
                    expect(page.driver.browser.switch_to.alert.text).to eq "ログアウトします。本当によろしいですか？"
                    page.driver.browser.switch_to.alert.accept
                    expect(page).to have_content "ログアウトしました"
                }
            end
        end
    end
end