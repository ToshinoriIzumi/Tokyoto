
class Income < ApplicationRecord
  has_many :contidions_supports, dependent: :destroy

  validates :money, presence: true, uniqueness: true
  validates :is_myself, presence: true
  enum is_myself: { user: 0, other: 1 }
end
