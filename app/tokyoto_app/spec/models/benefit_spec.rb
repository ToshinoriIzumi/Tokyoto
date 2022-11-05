require 'rails_helper'

RSpec.describe Benefit, type: :model do
  xit '固定/変動、給付方法があれば有効であること' do

  end

  it '金額があれば有効であること' do
    benefit = Benefit.new(money: 400000)
    expect(benefit).to be_valid
  end

  it '金額が一意でなければ無効であること' do
    Benefit.create(money: 400000)
    benefit = Benefit.new(money: 400000)
    benefit.valid?
    expect(benefit.errors[:money]).to include('has already been taken')
  end

  xit '固定/変動がなければ無効であること' do

  end

  xit '給付方法がなければ無効であること' do
    
  end
end
