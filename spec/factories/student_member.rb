FactoryBot.define do
    factory :student_member do
        association :staff_member
        association :parent_member
        family_name { "山田" }
        given_name { "太郎" } 
        family_name_kana { "ヤマダ" }
        given_name_kana { "タロウ" }
        gender { "male" }
        birthday { "2000-11-05" }
        school_type { "junior_high_school" }
        school_year { 2 }
        password { "password" }
        password_confirmation { "password" }
    end
end