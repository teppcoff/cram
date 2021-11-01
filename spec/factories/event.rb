FactoryBot.define do
    factory :event do
        association :student_member
        association :staff_member
        title { "2限英語" }
        period { 2 }
        starts_at { "2021-11-01 17:00:00"}
        ends_at { "2021-11-01 18:00:00"}
    end
end