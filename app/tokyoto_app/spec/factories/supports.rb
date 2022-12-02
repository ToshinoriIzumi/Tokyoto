FactoryBot.define do
  factory :support do
    sequence(:support_name) { |n|"test_support_#{n}" }
    content { "test_support_content" }
    application_method { 'test' }
    application_limit { 'test' }
    url { 'example.com' }
  end
end
