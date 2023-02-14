require 'rails_helper'

RSpec.describe Status, type: :model do
  before do
    @status = Status.new(status: 'テスト条件')
  end

  it '条件がある場合、有効であること' do
    expect(@status).to be_valid
  end

  it '条件がない場合、無効であること' do
    @status.status = nil
    @status.valid?
    expect(@status.errors[:status]).to include("を入力してください")
  end

  it 'statusが一意でなければ無効であること' do
    @status.save
    status_with_same_status = Status.new(status: 'テスト条件')
    status_with_same_status.valid?
    expect(status_with_same_status.errors[:status]).to include("はすでに存在します")
  end
end
