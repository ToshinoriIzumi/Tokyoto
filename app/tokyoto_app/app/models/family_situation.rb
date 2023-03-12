class FamilySituation < ApplicationRecord
  has_many :user_family_situations, dependent: :destroy
  has_many :users, through: :user_family_situations

  validates :situation, presence: true

  scope :load_public_assistance_situation, -> { where("situation LIKE ?", "生活保護%") }
  scope :load_dependency_situation, -> { where("situation LIKE ?", "扶養%") }
  scope :load_child_situation, -> { where("situation LIKE ?", "%子%") }

end
