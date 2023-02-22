class SupportsTag < ApplicationRecord
  belongs_to :support
  belongs_to :tag
end
