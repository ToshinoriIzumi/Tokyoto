require 'rails_helper'

RSpec.describe Hospital, type: :model do
  # 連絡先、営業時間あってもいいかも
  # FactoryBotでcityとhospitalを関連付けてリファクタ
  # rand以外の方法
  it '地区id、病院名、緯度、経度、住所があれば有効であること' do
    hospital = Hospital.new(
      city_id: 1,
      name: '病院1',
      latitude: rand,
      longitude: rand,
      address: '東京都test1区test11-1-1',
    )
  end

  it '地区idがなければ無効であること' do
    hospital = Hospital.new(city_id: nil)
    hospital.valid?
    expect(hospital.errors[:city_id]).to include("can't be blank")
  end

  it '病院名がなければ無効であること' do
    hospital = Hospital.new(name: nil)
    hospital.valid?
    expect(hospital.errors[:name]).to include("can't be blank")
  end

  # ユニーク制約のテストの書き方確認
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

  it '住所が重複していたら無効であること' do
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
