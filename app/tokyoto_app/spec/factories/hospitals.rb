FactoryBot.define do
  factory :hospital do
    name { 'test_hospital' }
    latitude { 35.727936 }
    longitude { 139.66392 }
    address { 'test_address' }
    association :city
  end
end
