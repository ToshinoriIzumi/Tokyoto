class Tag < ApplicationRecord
  has_many :support_tags, dependent: :destroy
  has_many :supports, through: :support_tags

  validates :name, presence: true, uniqueness: true
  validates :color, presence: true, uniqueness: true
end
