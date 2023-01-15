class Status < ApplicationRecord
  has_many :conditions_supports_statuses, dependent: :destroy
  validates :status, presence: true, uniqueness: true
end
