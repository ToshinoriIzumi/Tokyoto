require 'rails_helper'

RSpec.describe ConditionsSupport, type: :model do
  describe 'validation' do
    it 'support_id、city_id、扶養家族数、income_id、age_id、status_id、benefit_idがあれば有効であること' do
      support = Support.create(
        support_name: 'support1',
        content: 'support1_content',
        url: 'https://www.support1.com',
      )
      city = City.create(city_name: 'test区')
      income = Income.create(money: 2000000, is_myself: 0)
      age = Age.create(min: 0, max: 20)
      status = Status.create(status: 0)
      benefit = Benefit.create(money: 400000)

      conditions_support = ConditionsSupport.new(
        support_id: support.id,
        city_id: city.id,
        dependents_num: 1,
        income_id: income.id,
        age_id: age.id,
        status_id: status.id,
        benefit_id: benefit.id
      )
      expect(conditions_support).to be_valid
    end

    it '制度idがなければ無効であること' do
      conditions_support = ConditionsSupport.new(support_id: nil)
      conditions_support.valid?
      expect(conditions_support.errors[:support]).to include('must exist')
    end

    it '地区idがなければ無効であること' do
      conditions_support = ConditionsSupport.new(city_id: nil)
      conditions_support.valid?
      expect(conditions_support.errors[:city]).to include('must exist')
    end

    it '扶養家族数がなければ無効であること' do
      conditions_support = ConditionsSupport.new(dependents_num: nil)
      conditions_support.valid?
      expect(conditions_support.errors[:support]).to include('must exist')
    end

    it '所得額idがなければ無効であること' do
      conditions_support = ConditionsSupport.new(income_id: nil)
      conditions_support.valid?
      expect(conditions_support.errors[:income]).to include('must exist')
    end

    it '年齢idがなければ無効であること' do
      conditions_support = ConditionsSupport.new(age_id: nil)
      conditions_support.valid?
      expect(conditions_support.errors[:age]).to include('must exist')
    end

    it '請求者idがなければ無効であること' do
      conditions_support = ConditionsSupport.new(status_id: nil)
      conditions_support.valid?
      expect(conditions_support.errors[:status]).to include('must exist')
    end

    it '給付額idがなければ無効であること' do
      conditions_support = ConditionsSupport.new(benefit_id: nil)
      conditions_support.valid?
      expect(conditions_support.errors[:benefit]).to include('must exist')
    end

    it '制度id、地区id、扶養家族数、所得額id、年齢id、請求者id、給付額idの組み合わせが一意でなければ無効であること' do
      support = Support.create(
        support_name: 'support1',
        content: 'support1_content',
        url: 'https://www.support1.com',
      )
      city = City.create(city_name: 'test区')
      income = Income.create(money: 2000000, is_myself: 0)
      age = Age.create(min: 0, max: 20)
      status = Status.create(status: 0)
      benefit = Benefit.create(money: 400000)

      ConditionsSupport.create(
        support_id: support.id,
        city_id: city.id,
        dependents_num: 1,
        income_id: income.id,
        age_id: age.id,
        status_id: status.id,
        benefit_id: benefit.id
      )

      conditions_support = ConditionsSupport.new(
        support_id: support.id,
        city_id: city.id,
        dependents_num: 1,
        income_id: income.id,
        age_id: age.id,
        status_id: status.id,
        benefit_id: benefit.id
      )
      conditions_support.valid?
      expect(conditions_support.errors[:support]).to include('has already been taken')
    end
  end

  describe 'scope' do
    it 'age_searchで正しい検索ができること' do
      support = Support.create(
        support_name: 'support1',
        content: 'support1_content',
        url: 'https://www.support1.com',
      )
      city = City.create(city_name: 'test区')
      income = Income.create(money: 2000000, is_myself: 0)
      age = Age.create(min: 0, max: 20)
      status = Status.create(status: 0)
      benefit = Benefit.create(money: 400000)

      conditions_support = ConditionsSupport.create(
        support_id: support.id,
        city_id: city.id,
        dependents_num: 1,
        income_id: income.id,
        age_id: age.id,
        status_id: status.id,
        benefit_id: benefit.id
      )
      expect(ConditionsSupport.age_search(20)).to include(conditions_support)
    end
  end
end
