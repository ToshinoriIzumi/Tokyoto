class City < ApplicationRecord
  has_many :conditions_supports, dependent: :destroy

  validates :city_name, presence: true, uniqueness: true
end
