FactoryBot.define do
  factory :support do
    sequence(:support_name) { |n|"test_support_#{n}" }
    content { "test_support_content" }
    user_application_method { 'test' }
    user_application_limit { 'test' }
    user_renewal_method { '記載なし' }
    user_renewal_month { '記載なし' }
    publish_state { 0 }
  end
end
