require 'rails_helper'

RSpec.describe Child, type: :model do
  before do
    city = City.create(
      city_name: 'test区',
      latitude: 35.6130639,
      longitude: 139.6996014,
    )
    user = User.create(
      user_name: 'test',
      email: 'test@example.com',
      password: 'password',
      password_confirmation: 'password',
      role: 0,
      income: '5000000',
      city_id: city.id
      )
    @child = Child.new(
      user_id: user.id,
      birth: '2023-01-01',
      )
  end

  it 'user_idと年齢があれば有効であること' do
    expect(@child).to be_valid
  end

  it 'user_idがなければ無効であること' do
    @child.user_id = nil
    @child.valid?
    expect(@child.errors[:user]).to include("を入力してください")
  end
end
