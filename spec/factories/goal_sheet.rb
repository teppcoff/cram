FactoryBot.define do
    factory :goal_sheet do
        association :staff_member
        association :student_member
        name { "山田太郎3年1学期" }
        number_of_lessons { 20 }
        description { "前回国語40、数学60点" }
    end
end