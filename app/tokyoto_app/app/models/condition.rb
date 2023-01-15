class Condition < ApplicationRecord
  has_many :conditions_supports_statuses, dependent: :destroy
  has_many :statuses, through: :conditions_supports_statuses
  has_one :conditions_supports, primary_key: [:condition_id, :support_id]
end
