
class Income < ApplicationRecord
  has_many :conditions_supports, dependent: :destroy, primary_key: [:condition_id, support_id]

  validates :money, uniqueness: { scope: [:is_myself] }
  validates :is_myself, presence: true

  enum is_myself: { user: 0, other: 1 , household: 2 }
end
