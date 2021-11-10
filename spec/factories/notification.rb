FactoryBot.define do
    factory :notification do
        visitor_id { 1 }
        visited_id { 2 }
        action { "create_daily_sheet" }
    end
end