class SearchSupportsForm
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :support_name, :string
  attribute :tag_id, :integer
  attribute :state, :string

  def search
    relation = Support.distinct
    support_name_words.each do |support_name|
      relation = relation.support_name_contain(support_name)
    end
    relation = relation.by_tag(tag_id) if tag_id.present?
    relation = relation.state_contain(state) if state.present?
    relation
  end

  private

  def support_name_words
    support_name.present? ? support_name.split(nil) : []
  end
end