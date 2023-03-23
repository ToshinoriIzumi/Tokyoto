require 'rails_helper'

RSpec.describe Status, type: :model do
  it '条件がある場合、有効であること' do
    status = build(:status)
    expect(status).to be_valid
  end
  
  it '条件がない場合、無効であること' do
    status = build(:status, status: nil)
    status.valid?
    expect(status.errors[:status]).to include("を入力してください")
  end
  
  it 'statusが一意でなければ無効であること' do
    status = create(:status)
    another_status = build(:status, status: status.status)
    another_status.valid?
    expect(another_status.errors[:status]).to include("はすでに存在します")
  end
end
