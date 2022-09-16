
class Income < ApplicationRecord
  has_many :conditions_supports, dependent: :destroy

  validates :money, presence: true, uniqueness: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :is_myself, presence: true
  enum is_myself: { user: 0, other: 1 , household: 2 }
end
