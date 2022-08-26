class City < ApplicationRecord
  has_many :contidions_supports, dependent: :destroy

  validates :city_name, presence: true, uniqueness: true
end
