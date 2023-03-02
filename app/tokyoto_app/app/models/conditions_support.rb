class ConditionsSupport < ApplicationRecord
  belongs_to :support
  belongs_to :city
  belongs_to :age
  belongs_to :condition
  has_many :conditions_supports_incomes, dependent: :destroy
  has_many :incomes, through: :conditions_supports_incomes

  has_many :conditions_supports_applications_methods, dependent: :destroy
  has_many :application_methods, through: :conditions_supports_applications_methods

  has_many :conditions_supports_applications_forms, dependent: :destroy
  has_many :application_forms, through: :conditions_supports_applications_forms

  has_many :conditions_supports_addinfo_applications, dependent: :destroy
  has_many :addinfo_applications, through: :conditions_supports_addinfo_applications

  has_many :conditions_supports_addinfo_conditions_supports, dependent: :destroy
  has_many :addinfo_conditions_support, through: :conditions_supports_addinfo_conditions_supports

  validates :payment, presence: true
  validates :url, presence: true
  validates :payment_limit, presence: true
  validates :payment_frequency, presence: true

  enum payment_limit: { fixed_amount: 0, monthly_limit: 1 , upper_limit: 2, full_payment: 3, partial_payment: 4 }
  enum payment_frequency: { lump: 0, every_one_month: 1 , every_two_months: 2, every_three_months: 3, every_four_months: 4, non_listed: 5, no_transfers: 6 }

  scope :age_search, -> (number){ joins(:age).where("min <= ? and ? <= max", number, number)}

  def self.ransackable_scopes(auth_object = nil)
    %i[age_search]
  end
end
