require 'rails_helper'

RSpec.describe City, type: :model do
  before do
    @city = City.new(
      city_name: 'test区',
      latitude: 35.6130639,
      longitude: 139.6996014,
    )
  end

  it '地区名、緯度、経度があれば有効であること' do
    expect(@city).to be_valid
  end

  it 'city_nameがなければ無効であること' do
    @city.city_name = nil
    @city.valid?
    expect(@city.errors[:city_name]).to include("を入力してください")
  end
  
  xit '緯度がなければ無効であること' do
    @city.latitude = nil
    @city.valid?
    expect(@city.errors[:latitude]).to include("を入力してください")
  end

  xit '経度がなければ無効であること' do
    @city.longitude = nil
    @city.valid?
    expect(@city.errors[:longitude]).to include("を入力してくださ")
  end

  it '緯度と経度が一意でなければ無効であること' do
    @city.save
    another_city = City.new(
      city_name: 'test区',
      latitude: 35.6130639,
      longitude: 139.6996014
      )
    another_city.valid?
    expect(another_city.errors[:longitude]).to include('はすでに存在します')
  end
end
