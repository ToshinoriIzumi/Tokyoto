class User < ApplicationRecord
  authenticates_with_sorcery!

  has_many :children, dependent: :destroy
  has_many :user_family_situations, dependent: :destroy
  has_many :family_situations, through: :user_family_situations

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  enum role: { general: 0, admin: 1 }

  validates :email, uniqueness: true, presence: true
  validates :user_name, presence: true, length: { maximum: 100 }

  def retrieve_public_assistance_situation
    family_situations.find_by("situation LIKE '生活保護%'").situation
  end

  def retrieve_dependency_situation
    family_situations.find_by("situation LIKE '扶養%'").situation
  end
end
