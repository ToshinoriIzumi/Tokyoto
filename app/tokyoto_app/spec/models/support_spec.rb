require 'rails_helper'

RSpec.describe Support, type: :model do
  describe 'validation' do
    it '全てのカラムに情報があれば有効であること' do
      support = build(:support)
      expect(support).to be_valid
    end
    
    it '支援名がなければ無効であること' do
      support = build(:support, support_name: nil)
      support.valid?
      expect(support.errors[:support_name]).to include("を入力してください")
    end
    
    it '支援内容がなければ無効であること' do
      support = build(:support, content: nil)
      support.valid?
      expect(support.errors[:content]).to include("を入力してください")
    end

    it 'publish_stateがなければ無効であること' do
      support = build(:support, publish_state: nil)
      support.valid?
      expect(support.errors[:publish_state]).to include("を入力してください")
    end
    
    it '支援名が一意でなければ無効であること' do
      support = create(:support)
      another_support = build(:support, support_name: support.support_name)
      another_support.valid?
      expect(another_support.errors[:support_name]).to include("はすでに存在します")
    end
  end
  describe 'scope' do
    xit 'by_tag' do
    end
    xit 'support_name_contain' do
    end
    xit 'state_contain' do
    end
  end
end
