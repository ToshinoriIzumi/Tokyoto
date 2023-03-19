class ConditionsSupportsAddinfoConditionsSupport < ApplicationRecord
  belongs_to :addinfo_conditions_support
  belongs_to :conditions_support

  validates :conditions_support_id, uniqueness: { scope: [:addinfo_conditions_support_id] }
end
