require 'rails_helper'

feature "student", type: :feature do
    feature "ユーザー登録と削除" do
        scenario "ユーザー登録できること" do
            visit root_path
            expect(page).to have_content("ようこそCramAppへ！")
            find("#student_login").click
            find("#student_signup").click
            fill_in "student_member_family_name", with: "Test"
            fill_in "student_member_given_name", with: "Student"
            fill_in "student_member_family_name_kana", with: "テスト"
            fill_in "student_member_given_name_kana", with: "スチューデント"
            select "男性", from: "性別"
            select "2010", from: "student_member[birthday(1i)]"
            select "11", from: "student_member[birthday(2i)]"
            select "5", from: "student_member[birthday(3i)]"
            select "第二中学校", from: "student_member_school_id"
            select "中学校", from: "student_member_school_type"
            select "1年生", from: "student_member_school_year"
            find("#student_member_subject_ids_6").check
            select "山田 太郎", from: "student_member_staff_member_id"
            select "田中 真一", from: "student_member_parent_member_id"
            fill_in "student_member_email", with: "test_student@example.com"
            fill_in "student_member_password", with: "password"
            fill_in "student_member_password_confirmation", with: "password"
            click_button "登録"
            expect(page).to have_content "ようこそ、Test Studentさん!"
        end

        scenario "ユーザー削除できること" do
            visit student_login_path
            fill_in "session_email", with: "test_student@example.com"
            fill_in "session_password", with: "password"
            click_button "ログイン"
            click_on "ユーザー情報"
            click_on "削除"
            expect {
                expect(page.driver.browser.switch_to.alert.text).to eq "ユーザー「Test Student」を削除します。本当によろしいですか？"
                page.driver.browser.switch_to.alert.accept
                expect(page).to have_content "ユーザーを削除しました"
            }
        end
    end

    feature "ユーザー登録後" do

        feature "ログイン失敗時" do
            scenario "ログインが失敗すること" do
                visit student_login_path
                fill_in "session_email", with: "ichiro@example.com"
                fill_in "session_password", with: "xxxxxxxx"
                click_button "ログイン"
                expect(page).to have_content "メールアドレスまたはパスワードが正しくありません"
            end
        end

        feature "ログイン失敗時" do
            background "ログインできること" do
                visit student_login_path
                fill_in "session_email", with: "ichiro@example.com"
                fill_in "session_password", with: "password"
                click_button "ログイン"
                expect(page).to have_content "ログインしました。ようこそ 田中 一郎 さん!"
            end

            scenario "お知らせを確認できること" do
                click_on "お知らせ"
                first("#show_post").click
                find(:css, "#target_content")
                click_on "一覧"
                expect(page).to have_content "お知らせ一覧"
            end

            scenario "デイリーシートを確認できること" do
                click_on "デイリーシート"
                first(:link, "表示").click
                expect(page).to have_content "テキスト"
                click_on "一覧"
                expect(page).to have_link "表示"
            end

            scenario "予定表を確認できること" do
                click_on "予定表"
                expect(current_path).to eq student_events_path
                # 本当はカレンダーが表示されていることをテストしたかった
                # selenium/standalone-chromeがm1macで使えない？
            end

            scenario "点数表を確認できること" do
                click_on "過去のテスト結果"
                first(:link, "表示する").click
                expect(page).to have_content "点数"
                click_on "一覧"
                expect(page).to have_link "表示する"
            end

            scenario "点数表を登録できること" do
                click_on "点数登録"
                select "第三高校1年前期中間", from: "score_sheet_examination_id"
                select "高校英語", from: "score_sheet_scores_attributes_0_subject_id"
                fill_in "点数", with: "score_sheet_scores_attributes_0_point"
                click_on "登録"
                expect(page).to have_content "登録しました"
            end

            scenario "点数表を編集できること" do
                click_on "過去のテスト結果"
                first(:link, "表示する").click
                click_on "編集する"
                click_on "更新"
                expect(page).to have_content "シートを更新しました"
            end

            scenario "点数表を削除できること" do
                click_on "過去のテスト結果"
                first(:link, "表示する").click
                click_on "削除"
                expect {
                    page.driver.browser.switch_to.alert.accept
                    expect(page).to have_content "シートを削除しました"
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
                expect(page).to have_content "CramAppの使い方(生徒)"
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
