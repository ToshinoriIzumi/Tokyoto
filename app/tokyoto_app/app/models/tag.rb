class Tag < ApplicationRecord
  belongs_to :support

  validates :name, presence: true
end
