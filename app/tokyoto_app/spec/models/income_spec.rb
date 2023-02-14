require 'rails_helper'

RSpec.describe Income, type: :model do
  before do
    @income = Income.create(
      money: 2000000,
      is_myself: 0
      )
  end

  it '金額、本人フラグがあれば有効であること' do
    expect(@income).to be_valid
  end

  xit '金額がなければ無効であること' do
    @income.money = nil
    @income.valid?
    expect(@income.errors[:money]).to include("を入力してください")
  end

  it '金額と本人フラグの組み合わせが一意でなければ無効であること' do
    @income.save
    another_income = Income.new(
      money: 2000000,
      is_myself: 0
      )
    another_income.valid?
    expect(another_income.errors[:money]).to include("はすでに存在します")
  end
end
