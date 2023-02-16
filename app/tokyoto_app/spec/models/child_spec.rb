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
end
