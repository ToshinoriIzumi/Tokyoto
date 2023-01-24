require 'rails_helper'

RSpec.describe Hospital, type: :model do
  describe 'validation' do
    it '地区id、病院名、緯度、経度、住所があれば有効であること' do
      hospital = Hospital.new(
        city_id: 1,
        name: '病院1',
        latitude: rand,
        longitude: rand,
        address: '東京都test1区test11-1-1',
      )
    end

    xit '地区idがなければ無効であること' do
      hospital = Hospital.new(city_id: nil)
      hospital.valid?
      expect(hospital.errors[:city_id]).to include("can't be blank")
    end

    it '病院名がなければ無効であること' do
      hospital = Hospital.new(name: nil)
      hospital.valid?
      expect(hospital.errors[:name]).to include("can't be blank")
    end

    xit '地区idと病院名が一意でなければ無効であること' do
      Hospital.create(
        city_id: 1,
        name: '病院1',
        latitude: rand,
        longitude: rand,
        address: '東京都test1区test11-1-1',
      )
      hospital = Hospital.new(
        city_id: 1,
        name: '病院1',
        latitude: rand,
        longitude: rand,
        address: '東京都test2区test22-2-2',
      )
      hospital.valid?
      expect(hospital.errors[:name]).to include("has already been taken")
    end

    it '緯度がなければ無効であること'  do
      hospital = Hospital.new(latitude: nil)
      hospital.valid?
      expect(hospital.errors[:latitude]).to include("can't be blank")
    end

    it '経度がなければ無効であること' do
      hospital = Hospital.new(longitude: nil)
      hospital.valid?
      expect(hospital.errors[:longitude]).to include("can't be blank")
    end

    it '住所がなければ無効であること' do
      hospital = Hospital.new(address: nil)
      hospital.valid?
      expect(hospital.errors[:address]).to include("can't be blank")
    end

    xit '住所が重複していたら無効であること' do
      Hospital.create(
        city_id: 1,
        name: '病院1',
        latitude: rand,
        longitude: rand,
        address: '東京都test1区test11-1-1',
      )
      hospital = Hospital.new(
        city_id: 2,
        name: '病院2',
        latitude: rand,
        longitude: rand,
        address: '東京都test1区test11-1-1',
      )
      hospital.valid?
      expect(hospital.errors[:address]).to include("has already been taken")
    end
  end

  describe 'scope' do
    it 'search_byで検索した区の病院がヒットすること' do
      
    end

    it 'search_byで検索した区以外の病院がヒットしないこと' do
      
    end
  end
end
