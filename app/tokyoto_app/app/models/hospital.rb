class Hospital < ApplicationRecord
  belongs_to :city

  validates :name, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true, uniqueness: { scope: [:latitude] }
  validates :address, presence: true, uniqueness: true

  scope :search_by, -> (city_id) { where(city_id: city_id) }
end
