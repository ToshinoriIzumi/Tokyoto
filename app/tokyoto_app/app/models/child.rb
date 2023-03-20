class Child < ApplicationRecord
  belongs_to :user

  validates :birth, presence: true
  enum sibling_composition: { first_child: 0, second_child: 1, three_child: 2, fourth_child: 3, fifth_child: 4, sixth_child: 5 }

  def age
    (Date.today.strftime('%Y%m%d').to_i - birth.strftime('%Y%m%d').to_i) / 10000
  end
end