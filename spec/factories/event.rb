FactoryBot.define do
    factory :event do
        association :student_member
        association :staff_member
        association :subject
        sequence(:title) { |n| "授業#{n}" }
        period { 2 }
        repeats_on { 1 }
        starts_at { "2021-11-01 17:00:00"}
        ends_at { "2021-11-01 18:00:00"}
        starts_on { "2021-11-01"}
        ends_on { "2021-12-05"}
    end
end