require 'rails_helper'

RSpec.describe City, type: :model do
  it '地区名、緯度、経度があれば有効であること' do
    city = City.new(city_name: 'test区', latitude: 35.6130639, longitude: 139.6996014)
    expect(city).to be_valid
  end

  xit '地区名が~区・市・村？で終わること' do

  end

  it 'city_nameがなければ無効であること' do
    city = City.new(city_name: nil)
    city.valid?
    expect(city.errors[:city_name]).to include("can't be blank")
  end

  fit 'city_nameが一意でなければ無効であること' do
    City.create(city_name: 'test区', latitude: 35.6130639, longitude: 139.6996014)
    city = City.new(city_name: 'test区')
    city.valid?
    expect(city.errors[:city_name]).to include("has already been taken")
  end

  xit '緯度がなければ無効であること' do

  end

  xit '経度がなければ無効であること' do

  end
end
