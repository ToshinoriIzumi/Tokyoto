require 'rails_helper'

RSpec.describe ConditionsSupport, type: :model do
  describe 'validation' do
    it 'support_id、city_id、扶養家族数、income_id、age_id、status_id、benefit_idがあれば有効であること' do
      conditions_support = build(:conditions_support)
      expect(conditions_support).to be_valid
    end
    
    it '制度idがなければ無効であること' do
      conditions_support = build(:conditions_support, support_id: nil)
      conditions_support.valid?
      expect(conditions_support.errors[:support]).to include('を入力してください')
    end
      
    it '地区idがなければ無効であること' do
      conditions_support = build(:conditions_support, city_id: nil)
      conditions_support.valid?
      expect(conditions_support.errors[:city]).to include('を入力してください')
    end
    
    it '年齢idがなければ無効であること' do
      conditions_support = build(:conditions_support, age_id: nil)
      conditions_support.valid?
      expect(conditions_support.errors[:age]).to include('を入力してください')
    end
    
    it '給付額idがなければ無効であること' do
      conditions_support = build(:conditions_support, condition_id: nil)
      conditions_support.valid?
      expect(conditions_support.errors[:condition]).to include('を入力してください')
    end
    
    it 'paymentがなければ無効であること' do
      conditions_support = build(:conditions_support, payment: nil)
      conditions_support.valid?
      expect(conditions_support.errors[:payment]).to include('を入力してください')
    end
    
    it 'urlがなければ無効であること' do
      conditions_support = build(:conditions_support, url: nil)
      conditions_support.valid?
      expect(conditions_support.errors[:url]).to include('を入力してください')
    end
  end
    
  describe 'scope' do
    it 'age_searchで正しい検索ができること' do
      conditions_support = create(:conditions_support)
      expect(ConditionsSupport.age_search(20)).to include(conditions_support)
    end
  end
end
