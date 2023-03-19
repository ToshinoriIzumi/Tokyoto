require 'rails_helper'

RSpec.describe Tag, type: :model do
  it 'タグの名前があれば有効であること' do
    tag = build(:tag)
    expect(tag).to be_valid
  end
  
  it 'タグの名前がなければ無効であること' do
    tag = build(:tag, name: nil)
    tag.valid?
    expect(tag.errors[:name]).to include("を入力してください")
  end
  
  it 'タグの名前が一意でなければ無効であること' do
    tag = create(:tag)
    another_tag = build(:tag, name: tag.name)
    another_tag.valid?
    expect(another_tag.errors[:name]).to include("はすでに存在します")
  end
end