require 'rails_helper'

RSpec.describe Age, type: :model do
  before do
    @age = Age.new(
      min: 0,
      max: 20,
    )
  end
  
  it '最低年齢、最高年齢があれば有効であること' do
    expect(@age).to be_valid
  end

  it '最低年齢がなければ無効であること' do
    @age.min = nil
    @age.valid?
    expect(@age.errors[:min]).to include("を入力してください")
  end

  it '最高年齢がなければ無効であること' do
    @age.max = nil
    @age.valid?
    expect(@age.errors[:max]).to include("を入力してください")
  end

  it '最低年齢と最高年齢が一意でなければ無効であること' do
    @age.save
    another_age = Age.new(min: 0, max: 20)
    another_age.valid?
    expect(another_age.errors[:min]).to include('はすでに存在します')
  end
end
