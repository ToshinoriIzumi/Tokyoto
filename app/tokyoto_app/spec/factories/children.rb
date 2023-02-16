FactoryBot.define do
  factory :child do
    birth {'2023-01-01'}
    association :user
  end
end
