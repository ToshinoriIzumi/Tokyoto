class ConditionsSupportsApplicationsForm < ApplicationRecord
  belongs_to :application_form
  belongs_to :conditions_support
end
