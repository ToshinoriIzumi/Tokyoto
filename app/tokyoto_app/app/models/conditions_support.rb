class ConditionsSupport < ApplicationRecord
  belongs_to :support
  belongs_to :city
  belongs_to :income
  belongs_to :age
  belongs_to :status
  belongs_to :benefit

end
