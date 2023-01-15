class Condition < ApplicationRecord
  has_many :conditions_supports_statuses, dependent: :destroy
  has_one :conditions_supports, primary_key: [:condition_id, :support_id]
end
