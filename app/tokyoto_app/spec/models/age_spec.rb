require 'rails_helper'

RSpec.describe Age, type: :model do
  
  it '最低年齢、最高年齢があれば有効であること' do
    age = build(:age)
    expect(age).to be_valid
  end
  
  it '最低年齢がなければ無効であること' do
    age = build(:age, min: nil)
    age.valid?
    expect(age.errors[:min]).to include("を入力してください")
  end
  
  it '最高年齢がなければ無効であること' do
    age = build(:age, max: nil)
    age.valid?
    expect(age.errors[:max]).to include("を入力してください")
  end
  
  it '最低年齢と最高年齢が一意でなければ無効であること' do
    age = create(:age)
    another_age = build(:age, min: age.min, max: age.max)
    another_age.valid?
    expect(another_age.errors[:min]).to include('はすでに存在します')
  end
end
