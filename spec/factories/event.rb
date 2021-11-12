FactoryBot.define do
    factory :event do
        association :student_member
        association :staff_member
        association :subject
        association :period
        sequence(:title) { |n| "授業#{n}" }
        repeats_on { 1 }
        starts_at { "17:00:00"}
        ends_at { "18:00:00"}
        starts_on { "2021-11-01"}
        ends_on { "2021-12-05"}
    end
end