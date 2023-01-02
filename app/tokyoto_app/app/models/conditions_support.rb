class ConditionsSupport < ApplicationRecord
  belongs_to :support
  belongs_to :city
  belongs_to :income
  belongs_to :age
  belongs_to :status
  belongs_to :benefit
  has_many :conditions_supports_benefit, foreign_key: [:condition_id, :support_id]
  has_many :conditions_supports_status, foreign_key: [:condition_id, :support_id]

  self.primary_key = :condition_id, :support_id

  scope :age_search, -> (number){ joins(:age).where("min <= ? and ? <= max", number, number)}

  def self.ransackable_scopes(auth_object = nil)
    %i[age_search]
  end
end
