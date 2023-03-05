class FamilyStuation < ApplicationRecord
  has_many :user_family_stuations, dependent: :destroy
  has_many :users, through: :user_family_stuations

  validates :stuation, presence: true

  scope :where_public_assistance_stuation, -> { where("stuation LIKE ?", "生活保護%") }
  scope :where_dependency_stuation, -> { where("stuation LIKE ?", "扶養%") }
  scope :where_child_stuation, -> { where("stuation LIKE ?", "%子%") }

end
