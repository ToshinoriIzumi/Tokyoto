class Status < ApplicationRecord
  has_many :conditions_supports, dependent: :destroy

  validates :status, presence: true
  enum status: { single_parent: 0, orphan: 1, caregiver: 2 }
end
