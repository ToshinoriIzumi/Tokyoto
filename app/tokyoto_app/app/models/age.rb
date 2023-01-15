class Age < ApplicationRecord
  has_many :conditions_supports, dependent: :destroy, primary_key: [:condition_id, :support_id]

  validates :min, presence: true, uniqueness: { scope: [:max] }
  validates :max, presence: true
end
