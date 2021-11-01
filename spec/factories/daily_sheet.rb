FactoryBot.define do
    factory :daily_sheet do
        association :staff_member
        association :student_member
        association :subject
        study_date { "2021-11-01" }
        period { 2 }
        message { "よくできました" }
        information { "特にありません" }
    end
end