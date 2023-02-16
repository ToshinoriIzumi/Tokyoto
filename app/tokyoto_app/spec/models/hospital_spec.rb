require 'rails_helper'

RSpec.describe Hospital, type: :model do
  describe 'validation' do
    it '全てのカラムに情報があれば有効であること' do
      hospital = build(:hospital)
      expect(hospital).to be_valid
    end
    
    it 'city_idがなければ無効であること' do
      hospital = build(:hospital, city: nil)
      hospital.valid?
      expect(hospital.errors[:city]).to include("を入力してください")
    end
    
    it '病院名がなければ無効であること' do
      hospital = build(:hospital, name: nil)
      hospital.valid?
      expect(hospital.errors[:name]).to include("を入力してください")
    end
    
    it '緯度がなければ無効であること'  do
      hospital = build(:hospital, latitude: nil)
      hospital.valid?
      expect(hospital.errors[:latitude]).to include("を入力してください")
    end
    
    it '経度がなければ無効であること' do
      hospital = build(:hospital, longitude: nil)
      hospital.valid?
      expect(hospital.errors[:longitude]).to include("を入力してください")
    end
    
    it '緯度と経度が一意でなければ無効であること' do
      hospital = create(:hospital)
      another_hospital = build(
        :hospital,
        latitude: hospital.latitude,
        longitude: hospital.longitude
        )
      another_hospital.valid?
      expect(another_hospital.errors[:longitude]).to include('はすでに存在します')
    end
      
    it '住所がなければ無効であること' do
      hospital = build(:hospital, address: nil)
      hospital.valid?
      expect(hospital.errors[:address]).to include("を入力してください")
    end
  end

  describe 'scope' do
    it 'search_byで検索した区の病院がヒットすること' do
    end

    it 'search_byで検索した区以外の病院がヒットしないこと' do
    end
  end
end
