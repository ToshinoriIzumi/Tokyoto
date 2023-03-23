class Status < ApplicationRecord
  has_many :conditions_supports_statuses, dependent: :destroy
  has_many :conditions, through: :conditions_supports_statuses

  validates :status, presence: true, uniqueness: true

  scope :load_public_assistance, -> { where("status LIKE ?", "生活保護") }
  scope :load_children_counts, -> { where("status LIKE ?", "%子%") }
end
