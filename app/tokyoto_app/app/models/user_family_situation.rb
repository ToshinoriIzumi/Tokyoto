class UserFamilySituation < ApplicationRecord
    belongs_to :user
    belongs_to :family_situation

    validates :user, presence: true
    validates :family_situation, presence: true
end
