FactoryBot.define do
    factory :parent_member do
        sequence(:email) { |n| "parent#{n}@example.com" }
        family_name { "山田" }
        given_name { "太郎" } 
        family_name_kana { "ヤマダ" }
        given_name_kana { "タロウ" }
        gender { "male" }
        birthday { "2000-11-05" }
        password { "password" }
        password_confirmation { "password" }
    end
end
