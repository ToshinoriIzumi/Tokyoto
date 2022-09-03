class Age < ApplicationRecord
  has_many :conditions_supports, dependent: :destroy

  validates :min, presence: true, uniqueness: { scope: [:max] }
  validates :max, presence: true
end
