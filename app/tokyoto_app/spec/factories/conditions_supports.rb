FactoryBot.define do
  factory :conditions_support do
    dependents_num { 1 }
    association :support
    association :city
    association :income
    association :age
    association :status
    association :benefit
  end
end
