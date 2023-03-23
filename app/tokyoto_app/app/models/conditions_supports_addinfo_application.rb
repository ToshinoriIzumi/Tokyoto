class ConditionsSupportsAddinfoApplication < ApplicationRecord
  belongs_to :addinfo_application
  belongs_to :conditions_support

  validates :conditions_support_id, uniqueness: { scope: [:addinfo_application_id] }
end
