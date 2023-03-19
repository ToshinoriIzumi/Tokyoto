require 'rails_helper'

RSpec.describe SupportsTag, type: :model do
  it 'support_idとtag_idがある場合、有効であること' do
    supports_tag = build(:supports_tag)
    expect(supports_tag).to be_valid
  end
  
  it 'support_idがない場合、無効であること' do
    supports_tag = build(:supports_tag, support_id: nil)
    supports_tag.valid?
    expect(supports_tag.errors[:support]).to include("を入力してください")
  end
  
  it 'tag_idがない場合、無効であること' do
    supports_tag = build(:supports_tag, tag_id: nil)
    supports_tag.valid?
    expect(supports_tag.errors[:tag]).to include("を入力してください")
  end
end
