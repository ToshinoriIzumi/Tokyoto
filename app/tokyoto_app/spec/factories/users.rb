FactoryBot.define do
  factory :user do
    first_name { 'user' }
    last_name { 'test' }
    email { 'testuser@example.com' }
    password { 'password' }
    password_confirmation { 'password' }
    role { 0 }
  end
end
