FactoryBot.define do
  factory :supports_tag do
    association :support
    association :tag
  end
end
