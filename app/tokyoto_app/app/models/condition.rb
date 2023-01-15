class Condition < ApplicationRecord
  has_many :conditions_supports_statuses, dependent: :destroy
  belongs_to conditions_supports, primary_key: [:condition_id, :support_id]
end
