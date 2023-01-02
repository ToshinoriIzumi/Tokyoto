class ConditionsSupport < ApplicationRecord
  belongs_to :support
  belongs_to :city
  belongs_to :income
  belongs_to :age
  belongs_to :status
  has_one :condition

  validates :dependents_num, presence: true
  validates :payment, presence: true

  self.primary_key = :condition_id, :support_id

  scope :age_search, -> (number){ joins(:age).where("min <= ? and ? <= max", number, number)}

  def self.ransackable_scopes(auth_object = nil)
    %i[age_search]
  end
end
