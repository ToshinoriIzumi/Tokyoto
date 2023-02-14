require 'rails_helper'

RSpec.describe Tag, type: :model do
  before do
    @tag = Tag.new(name: 'tag_name')
  end

  it 'タグの名前があれば有効であること' do
    expect(@tag).to be_valid
  end

  it 'タグの名前がなければ無効であること' do
    @tag.name = nil
    @tag.valid?
    expect(@tag.errors[:name]).to include("を入力してください")
  end

  it 'タグの名前が一意でなければ無効であること' do
    @tag.save
    tag_with_same_name = Tag.new(name: 'tag_name')
    tag_with_same_name.valid?
    expect(tag_with_same_name.errors[:name]).to include("はすでに存在します")
  end
end