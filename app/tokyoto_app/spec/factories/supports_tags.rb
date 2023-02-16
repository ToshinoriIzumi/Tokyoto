FactoryBot.define do
  factory :support_tag do
    association :support
    association :tag
  end
end
