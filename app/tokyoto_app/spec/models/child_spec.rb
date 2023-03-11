require 'rails_helper'

RSpec.describe Child, type: :model do

  it 'user_idと年齢があれば有効であること' do
    child = build(:child)
    expect(child).to be_valid
  end
  
  it 'user_idがなければ無効であること' do
    child = build(:child, user_id: nil)
    child.valid?
    expect(child.errors[:user]).to include("を入力してください")
  end

  it '子供の年齢がなければ無効であること' do
    child = build(:child, birth: nil)
    child.valid?
    expect(child.errors[:birth]).to include("を入力してください")
  end
end
