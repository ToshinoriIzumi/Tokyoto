require 'date'

FactoryBot.define do
  factory :child do
    birth { Date.new(2020, 1, 1) }
    association :user
  end
end
