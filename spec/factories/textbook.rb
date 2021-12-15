FactoryBot.define do
    factory :textbook do
        association :subject
        name { "小一漢字ドリル" }
        text_type { "workbook" }
    end
end