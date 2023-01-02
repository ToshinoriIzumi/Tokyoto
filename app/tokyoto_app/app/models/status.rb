class Status < ApplicationRecord
  has_many :conditions_supports, dependent: :destroy

  validates :status, presence: true
end
