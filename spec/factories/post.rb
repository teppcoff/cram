FactoryBot.define do
    factory :post do
        association :staff_member
        title { "お知らせ" }
        content { "これはおしらせの例文です" }
    end
end