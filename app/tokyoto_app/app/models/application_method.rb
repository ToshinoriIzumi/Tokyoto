class ApplicationMethod < ApplicationRecord
  has_many :conditions_supports_applications_methods, dependent: :destroy
  has_many :conditions_supports, through: :conditions_supports_applications_methods

  validates :application_method, presence: true
  enum method_order: { first: 0, second: 1, third: 2, forth: 3, fifth: 4 }
end
