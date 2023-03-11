class ApplicationMethod < ApplicationRecord
  has_many :conditions_supports_applications_methods, dependent: :destroy
  has_many :conditions_supports, through: :conditions_supports_applications_methods

  validates :application_method, presence: true
  enum method_order: { first_method: 0, second_methods: 1, third_methods: 2, forth_methods: 3, fifth_methods: 4 }
end
