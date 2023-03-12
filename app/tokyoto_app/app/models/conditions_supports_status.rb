class ConditionsSupportsStatus < ApplicationRecord
  belongs_to :condition
  belongs_to :status

  validates :condition_id, uniqueness: { scope: [:status_id] }
end
