class Child < ApplicationRecord
  belongs_to :user

  validates :birth, presence: true
end
