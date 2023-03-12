class ConditionsSupportsApplicationsForm < ApplicationRecord
  belongs_to :application_form
  belongs_to :conditions_support

  validates :conditions_support_id, uniqueness: { scope: [:application_form_id] }
end
