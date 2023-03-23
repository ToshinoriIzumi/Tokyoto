FactoryBot.define do
  factory :conditions_supports_status do
    association :condition
    association :status    
  end
end
