FactoryBot.define do
  factory :user, aliases: [:seller] do
    sequence(:email) { |n| "tester#{n}@example.com" }
    password              {1234567}
    nickname              {"test"}
    last_name             {"mercari"}
    first_name            {"taro"}
    last_name_kana        {"メルカリ"}
    first_name_kana       {"タロウ"}
    birth_year_id         {1977}
    birth_month           {3}
    birth_day             {20}
    mobile_number         {12345678901}
  end
end