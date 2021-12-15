FactoryBot.define do
    factory :examination do
        association :school
        name { "第四高校一年前期中間" }
        academic_year { 2021 }
    end
end