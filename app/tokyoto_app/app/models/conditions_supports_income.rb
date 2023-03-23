class ConditionsSupportsIncome < ApplicationRecord
  belongs_to :conditions_support
  belongs_to :income

  validates :conditions_support_id, uniqueness: { scope: [:income_id] }
end
