class UserStatus < ApplicationRecord
  belongs_to :user

  # def change_boolean
  #   if is_status === 5
  #     true
  #   elsif is_status === 18
  #     false
  #   end
  # end

  # def change_word
  #   return is_status === nil
  #   if is_status === 19
  #     'one'
  #   elsif is_status === 20
  #     'two'
  #   elsif is_status === 21
  #     'three_than'
  #   end
  # end
end
