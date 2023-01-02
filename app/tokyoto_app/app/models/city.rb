class City < ApplicationRecord
  has_many :conditions_supports, dependent: :destroy, primary_key: [:condition_id, support_id]
  has_many :Hospital, dependent: :destroy

  validates :city_name, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true
end
