require 'rails_helper'

RSpec.describe ConditionsSupportsIncome, type: :model do
  describe 'validation' do
    before do
      condition = Condition.create
      age = Age.create(
        min: 0,
        max: 20
        )
      support = Support.create(
        support_name: 'support1',
        content: 'support1_content',
        user_application_method: 'support1_user_application_method',
        user_application_limit: '記載なし',
        user_renewal_method: '記載なし',
        user_renewal_month: '記載なし',
        publish_state: 0,
        )
      city = City.create(
        city_name: 'test区',
        latitude: 35.6130639,
        longitude: 139.6996014
        )
      conditions_support = ConditionsSupport.create(
        condition_id: condition.id,
        support_id: support.id,
        city_id: city.id,
        age_id: age.id,
        payment: 100000,
        url: 'https://www.example.com',
        payment_limit: 0,
        payment_frequency: 5,
        payment_month: '記載なし',
        transfer_destination: '記載なし',
        )
      income = Income.create(
        money: 2000000,
        is_myself: 0
        )
      @conditions_supports_income = ConditionsSupportsIncome.new(
        conditions_support_id: conditions_support.id,
        income_id: income.id
      )
    end

    it 'conditions_support_idとincome_idがあれば有効であること' do
      expect(@conditions_supports_income).to be_valid
    end

    it 'conditions_support_idがなければ無効であること' do
      @conditions_supports_income.conditions_support_id = nil
      @conditions_supports_income.valid?
      expect(@conditions_supports_income.errors[:conditions_support]).to include('を入力してください')
    end

    it 'income_idがなければ無効であること' do
      @conditions_supports_income.income_id = nil
      @conditions_supports_income.valid?
      expect(@conditions_supports_income.errors[:income]).to include('を入力してください')
    end
  end
end
