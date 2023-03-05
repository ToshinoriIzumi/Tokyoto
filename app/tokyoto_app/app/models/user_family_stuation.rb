class UserFamilyStuation < ApplicationRecord
    belongs_to :user
    belongs_to :family_stuation

    validates :user, presence: true
    validates :family_stuation, presence: true
end
