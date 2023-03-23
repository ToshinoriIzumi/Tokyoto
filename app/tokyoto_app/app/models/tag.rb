class Tag < ApplicationRecord
  has_many :supports_tags, dependent: :destroy
  has_many :supports, through: :supports_tags

  validates :name, presence: true, uniqueness: true
end
