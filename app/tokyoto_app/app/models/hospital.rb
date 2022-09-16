class Hospital < ApplicationRecord
  belongs_to :city

  validates :name, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true
  validates :address, presence: true
  validates :city, presence: true

  scope :search_by, -> (city_id) { where(city_id: city_id) }
end
