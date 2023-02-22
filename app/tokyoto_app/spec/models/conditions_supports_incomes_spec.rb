require 'rails_helper'

RSpec.describe ConditionsSupportsIncome, type: :model do
  it 'conditions_support_idとincome_idがあれば有効であること' do
    conditions_supports_income = build(:conditions_supports_income)
    expect(conditions_supports_income).to be_valid
  end
  
  it 'conditions_support_idがなければ無効であること' do
    conditions_supports_income = build(:conditions_supports_income, conditions_support_id: nil)
    conditions_supports_income.valid?
    expect(conditions_supports_income.errors[:conditions_support]).to include('を入力してください')
  end
  
  it 'income_idがなければ無効であること' do
    conditions_supports_income = build(:conditions_supports_income, income_id: nil)
    conditions_supports_income.valid?
    expect(conditions_supports_income.errors[:income]).to include('を入力してください')
  end
end
