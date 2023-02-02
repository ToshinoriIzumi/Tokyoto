
class Income < ApplicationRecord
  has_many :conditions_supports, dependent: :destroy
  has_many :conditions_supports_incomes, dependent: :destroy
  has_many :conditions_supports, through: :conditions_supports_incomes

  validates :money, uniqueness: { scope: [:is_myself] }, presence: true
  validates :is_myself, presence: true

  enum is_myself: { user: 0, household: 1, spouse_and_support_obligor: 2, business_income: 3 }
end
