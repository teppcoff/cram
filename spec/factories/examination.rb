FactoryBot.define do
    factory :examination do
        association :school
        name { "一年前期中間" }
    end
end