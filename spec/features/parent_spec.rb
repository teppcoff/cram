require 'rails_helper'

feature "parent", type: :feature do
    feature "ユーザー登録と削除" do
        scenario "ユーザー登録できること" do
            visit root_path
            expect(page).to have_content("ようこそCramAppへ！")
            find("#parent_login").click
            find("#parent_signup").click
            fill_in "性", with: "Test"
            fill_in "名", with: "Parent"
            fill_in "性（フリガナ）", with: "テスト"
            fill_in "名（フリガナ）", with: "ペアレント"
            select "男性", from: "性別"
            select "1980", from: "parent_member[birthday(1i)]"
            select "11", from: "parent_member[birthday(2i)]"
            select "5", from: "parent_member[birthday(3i)]"
            fill_in "メールアドレス:", with: "test_parent@example.com"
            select "山田 太郎", from: "担当講師:"
            fill_in "パスワード", with: "password"
            fill_in "パスワード（確認）", with: "password"
            click_button "登録"
            expect(page).to have_content "ようこそ、Test Parentさん!"
        end

        scenario "ユーザー削除できること" do
            visit parent_login_path
            fill_in "メールアドレス", with: "test_parent@example.com"
            fill_in "パスワード", with: "password"
            click_button "ログイン"
            click_on("ユーザー情報")
            click_on("削除")
            expect {
                expect(page.driver.browser.switch_to.alert.text).to eq "ユーザー「Test Parent」を削除します。本当によろしいですか？"
                page.driver.browser.switch_to.alert.accept
                expect(page).to have_content "ユーザーを削除しました"
            }
        end
    end

    feature "ユーザー登録後" do
        background "ログインできること" do
            visit parent_login_path
            fill_in "メールアドレス", with: "shinichi@example.com"
            fill_in "パスワード", with: "password"
            click_button "ログイン"
            expect(page).to have_content "ログインしました。ようこそ 田中 真一 さん!"
        end

        scenario "お知らせを確認できること" do
            click_on("お知らせ")
            first("#show_post").click
            find(:css, "#target_content")
            click_on("一覧")
            expect(page).to have_content "お知らせ一覧"
        end

        scenario "デイリーシートを確認できること" do
            first(:link, "デイリーシート").click
            first(:link, "表示").click
            expect(page).to have_content "テキスト"
            click_on("一覧")
            expect(page).to have_link "表示"
        end

        scenario "点数表を確認できること" do
            click_on("点数表")
            first(:link, "表示する").click
            expect(page).to have_content "点数"
            click_on("一覧")
            expect(page).to have_link "表示する"
        end

        scenario "予定表を確認できること" do
            click_on("予定表")
            expect(current_path).to eq parent_events_path
            # 本当はカレンダーが表示されていることをテストしたかった
            # selenium/standalone-chromeがm1macで使えない？
        end

        scenario "教室情報を確認できること" do
            click_on("教室情報")
            expect(page).to have_content "住所:"
        end

        scenario "ユーザー情報を確認できること" do
            click_on("ユーザー情報")
            click_on("編集")
            expect(page).to have_content "性"
            click_on("更新")
            expect(page).to have_content "ユーザー情報を更新しました"
        end

        scenario "使い方を確認できること" do
            click_on("使い方")
            expect(page).to have_content "CramAppの使い方(保護者)"
        end

        scenario "ログアウトできること" do
            click_on("ログアウト")
            expect {
                expect(page.driver.browser.switch_to.alert.text).to eq "ログアウトします。本当によろしいですか？"
                page.driver.browser.switch_to.alert.accept
                expect(page).to have_content "ログアウトしました"
            }
        end
    end
end