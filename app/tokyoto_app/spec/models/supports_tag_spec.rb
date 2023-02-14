require 'rails_helper'

RSpec.describe SupportTag, type: :model do
  before do
    tag = Tag.create(name: 'tag_name')
    support = Support.create(
      support_name: 'support1',
      content: 'support1_content',
      user_application_method: 'support1_user_application_method',
      user_application_limit: '記載なし',
      user_renewal_method: '記載なし',
      user_renewal_month: '記載なし',
      publish_state: 0,
      )
    @support_tag = SupportTag.new(
      support_id: support.id,
      tag_id: tag.id
      )
  end

  it 'support_idとtag_idがある場合、有効であること' do
    expect(@support_tag).to be_valid
  end

  it 'support_idがない場合、無効であること' do
    @support_tag.support_id = nil
    @support_tag.valid?
    expect(@support_tag.errors[:support]).to include("を入力してください")
  end

  it 'tag_idがない場合、無効であること' do
    @support_tag.tag_id = nil
    @support_tag.valid?
    expect(@support_tag.errors[:tag]).to include("を入力してください")
  end
end
