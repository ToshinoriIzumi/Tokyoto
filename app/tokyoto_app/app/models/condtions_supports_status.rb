class CondtionsSupportsStatus < ApplicationRecord
  belongs_to :condition
  belongs_to :status
end
