require 'rails_helper'

RSpec.describe SupportsTag, type: :model do
  before do
    tag = Tag.new(name: 'tag_name')
    support = Support.new(
      support_name: 'support1',
      content: 'support1_content',
      url: 'https://www.support1.com',
      )
    supports_tag = SupportsTag.new(
      support_id: support.id
      tag_id: tag.id
      )
  end

  it 'support_idとtag_idがある場合、有効であること' do
    expect(supports_tag).to be_valid
  end

  it 'support_idがない場合、無効であること' do
    supports_tag.support_id = nil
    supports_tag.valid?
    expect(supports_tag.errors[:support_id]).to include("can't be blank")
  end

  it 'tag_idがない場合、無効であること' do
    supports_tag.tag_id = nil
    supports_tag.valid?
    expect(supports_tag.errors[:tag_id]).to include("can't be blank")
  end
end
