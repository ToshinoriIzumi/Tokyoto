require 'rails_helper'

RSpec.describe City, type: :model do
  it '地区名があれば有効であること' do
    city = City.new(city_name: 'test区')
    expect(city).to be_valid
  end

  # これいる？
  xit '地区名が~区・市・村？で終わること' do

  end
end
