require 'rails_helper'

feature "parent", type: :feature do
    scenario "ユーザー登録ができること" do
        visit root_path
        expect(page).to have_content("ようこそCramAppへ！")
        find("#parent_login").click
        find("#parent_signup").click
        fill_in "性", with: "Test"
        fill_in "名", with: "Parent"
        fill_in "性（フリガナ）", with: "テスト"
        fill_in "名（フリガナ）", with: "ペアレント"
        select "男性", from: "性別"
        select "2000", from: "parent_member[birthday(1i)]"
        select "11", from: "parent_member[birthday(2i)]"
        select "5", from: "parent_member[birthday(3i)]"
        fill_in "メールアドレス:", with: "test@example.com"
        select "山田 太郎", from: "担当講師:"
        fill_in "パスワード", with: "password"
        fill_in "パスワード（確認）", with: "password"
        click_button "登録"
        expect(page).to have_content "ようこそ、Test Parentさん!"
    end
end