class Child < ApplicationRecord
  belongs_to :user

  validates :birth, presence: true

  def age(date)
    (Date.today.strftime('%Y%m%d').to_i - date.strftime('%Y%m%d').to_i) / 10000
  end
end
