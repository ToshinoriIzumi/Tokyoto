class Status < ApplicationRecord
  has_many :conditions_supports_statuses, dependent: :destroy
  has_many :conditions, through: :conditions_supports_statuses

  validates :status, presence: true, uniqueness: true

end
