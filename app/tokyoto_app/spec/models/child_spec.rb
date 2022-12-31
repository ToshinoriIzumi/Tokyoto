require 'rails_helper'

RSpec.describe Child, type: :model do
  it 'user_idと年齢があれば有効であること' do
    user = User.create(
      first_name: 'user',
      last_name: 'test',
      email: 'test@example.com',
      role: 0,
      password: 'password',
      password_confirmation: 'password',
    )
    child = Child.new(user_id: user.id, age: 5)
    expect(child).to be_valid
  end

  it 'user_idがなければ無効であること' do
    child = Child.new(user_id: nil)
    child.valid?
    expect(child.errors[:user]).to include("must exist")
  end

  it '年齢がなければ無効であること' do
    child = Child.new(age: nil)
    child.valid?
    expect(child.errors[:age]).to include("is not a number")
  end

  # 文字列で作っても数値で登録される？
  xit '年齢が数値でなければ無効であること' do
    child = Child.new(age: '5')
    child.valid?
    expect(child.errors[:age]).to include("is not a number")
  end

  it '年齢が0以上でなければ無効であること' do
    child = Child.new(age: -1)
    child.valid?
    expect(child.errors[:age]).to include('must be greater than or equal to 0')
  end

  xit '年齢が整数でなければ無効であること' do
    child = Child.new(age: 4.3)
    child.valid?
    expect(child.errors[:age]).to include('must be an integer')
  end
end
