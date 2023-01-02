class Support < ApplicationRecord
  has_many :conditions_supports, dependent: :destroy
  has_many :support_tags, dependent: :destroy
  has_many :tags, through: :support_tags

  validates :support_name, presence: true, uniqueness: true
  validates :content, presence: true
  validates :url, presence: true, uniqueness: true
end
