class Status < ApplicationRecord
  has_many :conditions_supports, dependent: :destroy

  validates :status, presence: true
  enum status: { single_parent: 0, orphan: 1, caregiver: 2, resident_taxed_household: 3, resident_not_taxed_household: 4, child_of_single_parent: 5 }
end
