require 'rails_helper'

RSpec.describe Hospital, type: :model do
  describe 'validation' do
    before do
      @city = City.create(
        city_name: 'test区',
        latitude: 35.6130639,
        longitude: 139.6996014,
      )
      @hospital = Hospital.new(
        city_id: @city.id,
        name: 'test区',
        latitude: 35.6130639,
        longitude: 139.6996014,
        address: '東京都test1区test11-1-1',
        url: 'https://www.test.com',
        phone_number: '(03)0000-0000',
      )
    end

    it '全てのカラムに情報があれば有効であること' do
      expect(@hospital).to be_valid
    end

    it 'city_idがなければ無効であること' do
      @hospital.city_id = nil
      @hospital.valid?
      expect(@hospital.errors[:city]).to include("を入力してください")
    end

    it '病院名がなければ無効であること' do
      @hospital.name = nil
      @hospital.valid?
      expect(@hospital.errors[:name]).to include("を入力してください")
    end

    it '緯度がなければ無効であること'  do
      @hospital.latitude = nil
      @hospital.valid?
      expect(@hospital.errors[:latitude]).to include("を入力してください")
    end

    it '経度がなければ無効であること' do
      @hospital.longitude = nil
      @hospital.valid?
      expect(@hospital.errors[:longitude]).to include("を入力してください")
    end
  
    it '緯度と経度が一意でなければ無効であること' do
      @hospital.save
      another_hospital = Hospital.new(
        city_id: @city.id,
        name: 'test区',
        latitude: 35.6130639,
        longitude: 139.6996014,
        address: '東京都test1区test11-1-1',
        url: 'https://www.test.com',
        phone_number: '(03)0000-0000',
        )
      another_hospital.valid?
      expect(another_hospital.errors[:longitude]).to include('はすでに存在します')
    end

    it '住所がなければ無効であること' do
      @hospital.address = nil
      @hospital.valid?
      expect(@hospital.errors[:address]).to include("を入力してください")
    end
  end

  describe 'scope' do
    it 'search_byで検索した区の病院がヒットすること' do
    end

    it 'search_byで検索した区以外の病院がヒットしないこと' do
    end
  end
end
