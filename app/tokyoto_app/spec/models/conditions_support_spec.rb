require 'rails_helper'

RSpec.describe ConditionsSupport, type: :model do
  describe 'validation' do
    before do
      @condition = Condition.create
      @age = Age.create(
        min: 0,
        max: 20
        )
      @support = Support.create(
        support_name: 'support1',
        content: 'support1_content',
        user_application_method: 'support1_user_application_method',
        user_application_limit: '記載なし',
        user_renewal_method: '記載なし',
        user_renewal_month: '記載なし',
        publish_state: 0,
        )
      @city = City.create(
        city_name: 'test区',
        latitude: 35.6130639,
        longitude: 139.6996014
        )
      @conditions_support = ConditionsSupport.new(
        condition_id: @condition.id,
        support_id: @support.id,
        city_id: @city.id,
        age_id: @age.id,
        payment: 100000,
        url: 'https://www.example.com',
        payment_limit: 0,
        payment_frequency: 5,
        payment_month: '記載なし',
        transfer_destination: '記載なし',
      )
    end

    it 'support_id、city_id、扶養家族数、income_id、age_id、status_id、benefit_idがあれば有効であること' do
      expect(@conditions_support).to be_valid
    end

    it '制度idがなければ無効であること' do
      @conditions_support.support_id = nil
      @conditions_support.valid?
      expect(@conditions_support.errors[:support]).to include('を入力してください')
    end

    it '地区idがなければ無効であること' do
      @conditions_support.city_id = nil
      @conditions_support.valid?
      expect(@conditions_support.errors[:city]).to include('を入力してください')
    end

    it '年齢idがなければ無効であること' do
      @conditions_support.age_id = nil
      @conditions_support.valid?
      expect(@conditions_support.errors[:age]).to include('を入力してください')
    end

    it '給付額idがなければ無効であること' do
      @conditions_support.condition_id = nil
      @conditions_support.valid?
      expect(@conditions_support.errors[:condition]).to include('を入力してください')
    end

    it 'paymentがなければ無効であること' do
      @conditions_support.payment = nil
      @conditions_support.valid?
      expect(@conditions_support.errors[:payment]).to include('を入力してください')
    end

    it 'urlがなければ無効であること' do
      @conditions_support.url = nil
      @conditions_support.valid?
      expect(@conditions_support.errors[:url]).to include('を入力してください')
    end

    xit 'condition_idとsupport_idの組み合わせが一意でなければ無効であること' do
      @conditions_support.save
      another_conditions_support = ConditionsSupport.new(
        condition_id: @condition.id,
        support_id: @support.id,
        city_id: @city.id,
        age_id: @age.id,
        payment: 100000,
        url: 'https://www.example.com',
        payment_limit: 0,
        payment_frequency: 5,
        payment_month: '記載なし',
        transfer_destination: '記載なし',
      )
      another_conditions_support.valid?
      expect(another_conditions_support.errors[:support_id]).to include('has already been taken')
    end
  end

  describe 'scope' do
    xit 'age_searchで正しい検索ができること' do
      @conditions_support.save
      expect(ConditionsSupport.age_search(20)).to include(@conditions_support)
    end
  end
end
