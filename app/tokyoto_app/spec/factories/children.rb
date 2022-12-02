FactoryBot.define do
  factory :child do
    age { 5 }
    association :user
  end
end
