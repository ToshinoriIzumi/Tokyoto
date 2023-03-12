class ConditionsSupportsApplicationsMethod < ApplicationRecord
  belongs_to :application_method
  belongs_to :conditions_support

  validates :conditions_support_id, uniqueness: { scope: [:application_method_id] }
end
