class Benefit < ApplicationRecord
  has_many :contidions_supports, dependent: :destroy

  validates :money, presence: true, uniqueness: true
end
