FactoryBot.define do
  factory :conditions_support do
    association :city
    association :condition
    association :support
    association :age
    payment { 100000 }
    url { 'https://www.example.com' }
    payment_limit { 0 }
    payment_frequency { 5 }
    payment_month { '記載なし' }
    transfer_destination { '記載なし' }
  end
end
