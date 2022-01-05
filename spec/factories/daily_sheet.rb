FactoryBot.define do
    factory :daily_sheet do
        association :staff_member
        association :student_member
        association :subject
        association :textbook
        association :period
        association :event
        study_date { "2021-11-01" }
        message { "よくできました" }
        information { "特にありません" }
        participation { "attendant" }
    end
end