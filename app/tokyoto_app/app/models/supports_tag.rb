class SupportsTag < ApplicationRecord
  belongs_to :support
  belongs_to :tag

  validates :support_id, uniqueness: { scope: [:tag_id] }
end
