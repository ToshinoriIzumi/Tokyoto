require 'rails_helper'

RSpec.describe Status, type: :model do
  it '請求者があれば有効であること' do
    status = Status.new(status: 0)
    expect(status).to be_valid
  end

  it '請求者がなければ無効であること' do
    status = Status.new(status: nil)
    status.valid?
    expect(status.errors[:status]).to include("can't be blank")
  end

  it '請求者が一意でなければ無効であること' do
    Status.create(status: 0)
    status = Status.new(status: 0)
    status.valid?
    expect(status.errors[:status]).to include("has been taken")
    # 実装不足orテストミス
  end
end
