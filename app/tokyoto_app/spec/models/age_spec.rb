require 'rails_helper'

RSpec.describe Age, type: :model do
  it '最低年齢、最高年齢があれば有効であること' do
    age = Age.new(min: 0, max: 20)
    expect(age).to be_valid
  end

  it '最低年齢がなければ無効であること' do
    age = Age.new(min: nil)
    age.valid?
    expect(age.errors[:min]).to include("can't be blank")
  end

  it '最高年齢がなければ無効であること' do
    age = Age.new(max: nil)
    age.valid?
    expect(age.errors[:max]).to include("can't be blank")
  end

  it '最低年齢と最高年齢が一意でなければ無効であること' do
    Age.create(min: 0, max: 20)
    age = Age.new(min: 0, max: 20)
    age.valid?
    expect(age.errors[:min]).to include('has already been taken')
  end
end
