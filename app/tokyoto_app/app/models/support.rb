class Support < ApplicationRecord
  has_many :conditions_supports, dependent: :destroy
  has_many :support_tags
  has_many :tags, through: :support_tags

  validates :support_name, presence: true
  validates :content, presence: true
  validates :url, presence: true
end
