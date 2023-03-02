class AddinfoApplication < ApplicationRecord
  has_many :conditions_supports_addinfo_applications, dependent: :destroy
  has_many :conditions_supports, through: :conditions_supports_addinfo_applications
end
