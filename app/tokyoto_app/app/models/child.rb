class Child < ApplicationRecord
  belongs_to :user

  validates :birth, presence: true

  enum sibling_conposition: { first_child: 0, second_child: 1 , third_child_and_above: 2 }
end
