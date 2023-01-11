require 'rails_helper'

RSpec.describe Tag, type: :model do
  before { tag = Tag.new(name: 'tag_name') }

  it 'タグの名前があれば有効であること' do
    expect(tag).to be_valid
  end

  it 'タグの名前がなければ無効であること' do
    tag.name = nil
    tag.valid?
    expect(tag.errors[:name]).to include("can't be blank")
  end

  it 'タグの名前が一意でなければ無効であること' do
    tag.save
    tag_with_same_name = Tag.new(name: 'tag_name')
    tag_with_same_name.valid?
    expect(tag_with_same_name.errors[:name]).to include("has already been taken")
  end
end