FactoryBot.define do
    factory :score_sheet do
        association :student_member
        association :staff_member
        association :examination
    end
end
