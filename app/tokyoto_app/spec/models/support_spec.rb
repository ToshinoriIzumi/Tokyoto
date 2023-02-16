require 'rails_helper'

RSpec.describe Support, type: :model do
  before do
    @support = Support.new(
      support_name: 'support1',
      content: 'support1_content',
      user_application_method: 'support1_user_application_method',
      user_application_limit: '記載なし',
      user_renewal_method: '記載なし',
      user_renewal_month: '記載なし',
      publish_state: 0,
      )
  end

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
  
  it '支援名が一意でなければ無効であること' do
    support = create(:support)
    another_support = build(:support, support_name: support.support_name)
    another_support.valid?
    expect(another_support.errors[:support_name]).to include("はすでに存在します")
  end
end
