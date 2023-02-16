require 'rails_helper'

RSpec.describe SupportTag, type: :model do
  it 'support_idとtag_idがある場合、有効であること' do
    support_tag = build(:support_tag)
    expect(support_tag).to be_valid
  end
  
  it 'support_idがない場合、無効であること' do
    support_tag = build(:support_tag, support_id: nil)
    support_tag.valid?
    expect(support_tag.errors[:support]).to include("を入力してください")
  end
  
  it 'tag_idがない場合、無効であること' do
    support_tag = build(:support_tag, tag_id: nil)
    support_tag.valid?
    expect(support_tag.errors[:tag]).to include("を入力してください")
  end
end
