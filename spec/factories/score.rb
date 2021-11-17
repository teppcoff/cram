FactoryBot.define do
    factory :score do
        association :score_sheet
        association :subject
        point { 70 }
    end
end