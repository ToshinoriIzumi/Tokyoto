class Child < ApplicationRecord
  belongs_to :user

  validates :birth, presence: true

  def age
    (Date.today.strftime('%Y%m%d').to_i - birth.strftime('%Y%m%d').to_i) / 10000
  end
end
