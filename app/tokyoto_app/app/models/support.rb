class Support < ApplicationRecord
  has_many :conditions_supports, dependent: :destroy

  validates :support_name, presence: true
  validates :content, presence: true
  validates :url, presence: true, uniqueness: true
end
