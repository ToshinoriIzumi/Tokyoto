require 'rails_helper'

RSpec.describe City, type: :model do

  it '地区名、緯度、経度があれば有効であること' do
    city = build(:city)
    expect(city).to be_valid
  end

  it 'city_nameがなければ無効であること' do
    city = build(:city, city_name: nil)
    city.valid?
    expect(city.errors[:city_name]).to include("を入力してください")
  end
  
  it '緯度がなければ無効であること' do
    city = build(:city, latitude: nil)
    city.valid?
    expect(city.errors[:latitude]).to include("を入力してください")
  end
  
  it '経度がなければ無効であること' do
    city = build(:city, longitude: nil)
    city.valid?
    expect(city.errors[:longitude]).to include("を入力してください")
  end

  it '緯度と経度が一意でなければ無効であること' do
    city = create(:city)
    another_city = 
      build(
        :city,
        longitude: city.longitude,
        latitude: city.latitude
      )
    another_city.valid?
    expect(another_city.errors[:longitude]).to include('はすでに存在します')
  end
end