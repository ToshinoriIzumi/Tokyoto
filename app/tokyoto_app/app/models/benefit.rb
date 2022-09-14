class Benefit < ApplicationRecord
  has_many :conditions_supports, dependent: :destroy

  validates :money, presence: true, uniqueness: true
end
