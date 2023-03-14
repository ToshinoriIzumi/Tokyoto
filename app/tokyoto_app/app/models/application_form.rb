class ApplicationForm < ApplicationRecord
  has_many :conditions_supports_applications_forms, dependent: :destroy
  has_many :conditions_supports, through: :conditions_supports_applications_forms

  validates :application_form_name, presence: true
end
