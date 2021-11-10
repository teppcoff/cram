FactoryBot.define do
    factory :textbook do
        association :subject
        sequence(:name) { |n| "text#{n}" }
        text_type { "workbook" }
    end
end