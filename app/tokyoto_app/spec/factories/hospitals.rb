FactoryBot.define do
  factory :hospital do
    name { 'test_hospital' }
    latitude { 35.727936 }
    longitude { 139.66392 }
    address { 'test_address' }
    url { 'https://www.test.com' }
    phone_number { '(03)0000-0000' }
    association :city
  end
end
