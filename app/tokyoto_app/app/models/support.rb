class Support < ApplicationRecord
  has_many :conditions_supports, dependent: :destroy, primary_key: [:condition_id, :support_id]
  has_many :support_tags
  has_many :tags, through: :support_tags

  validates :support_name, presence: true
  validates :content, presence: true
  validates :state, presence: true

  enum state: { draft: 0, published: 1, publish_wait: 2 }

  scope :by_tag, ->(tag_id) { joins(:tags).where(support_tags: { tag_id: tag_id }) }
  scope :support_name_contain, ->(support_name) { where('support_name LIKE ?', "%#{support_name}%") }
  scope :state_contain, ->(state) { where(state: state) }
end
