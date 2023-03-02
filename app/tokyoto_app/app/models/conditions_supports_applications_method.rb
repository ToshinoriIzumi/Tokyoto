class ConditionsSupportsApplicationsMethod < ApplicationRecord
  belongs_to :application_method
  belongs_to :conditions_support
end
