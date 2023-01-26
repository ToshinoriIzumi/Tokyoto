class ConditionsSupportsStatus < ApplicationRecord
  belongs_to :condition
  belongs_to :status
end
