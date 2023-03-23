FactoryBot.define do
  factory :conditions_supports_income do
    association :conditions_support
    association :income
  end
end
