require 'rails_helper'

RSpec.describe Income, type: :model do
  it '金額、本人フラグがあれば有効であること' do
    income = build(:income)
    expect(income).to be_valid
  end
  
  xit '金額がなければ無効であること' do
    income = build(:income, money: nil)
    income.valid?
    expect(income.errors[:money]).to include("を入力してください")
  end
  
  it '金額と本人フラグの組み合わせが一意でなければ無効であること' do
    income = create(:income)
    another_income = build(
      :income, 
      money: income.money,
      is_myself: income.is_myself
      )
    another_income.valid?
    expect(another_income.errors[:money]).to include("はすでに存在します")
  end
end
