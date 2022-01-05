FactoryBot.define do
    factory :event do
        association :student_member
        association :staff_member
        association :subject
        association :period
        sequence(:title) { |n| "授業#{n}" }
        starts_at { "17:00:00" }
        ends_at { "18:00:00" }
    end
end