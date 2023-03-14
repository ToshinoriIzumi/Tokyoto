class AddinfoConditionsSupport < ApplicationRecord
  has_many :conditions_supports_addinfo_conditions_supports, dependent: :destroy
  has_many :conditions_supports, through: :conditions_supports_addinfo_conditions_supports


  validates :info_content, presence: true
end
