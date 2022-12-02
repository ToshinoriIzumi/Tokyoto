require 'rails_helper'

RSpec.describe Income, type: :model do
  it '金額、本人フラグがあれば有効であること' do
    income = Income.new(money: 2000000, is_myself: 0)
    expect(income).to be_valid
  end

  xit '金額がなければ無効であること' do
    income = Income.new(money: nil)
    income.valid?
    expect(income.errors[:money]).to include("can't be blank")
  end

  it '本人フラグがなければ無効であること' do
    income = Income.new(is_myself: nil)
    income.valid?
    expect(income.errors[:is_myself]).to include("can't be blank")
  end

  it '金額と本人フラグの組み合わせが一意でなければ無効であること' do
    Income.create(money: 2000000, is_myself: 0)
    income = Income.new(money: 2000000, is_myself: 0)
    income.valid?
    expect(income.errors[:money]).to include("has already been taken")
  end
end
