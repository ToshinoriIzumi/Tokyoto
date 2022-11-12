class Tag < ApplicationRecord
  has_many :support_tags
  has_many :supports, through: :support_tags

  validates :name, presence: true
end
