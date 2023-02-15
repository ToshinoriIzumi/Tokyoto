FactoryBot.define do
  factory :user do
    user_name { "user" }
    sequence(:email) { |n| "testuser_#{n}@example.com" }
    password { 'password' }
    password_confirmation { 'password' }
    role { 0 }

    trait :with_profile do
      user_name { "テスト" }
      income { "100" }
      after( :create ) do |user|
        create :child, id: user.id
      end
    end
  end
end
