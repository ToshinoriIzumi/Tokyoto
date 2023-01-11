require 'rails_helper'

RSpec.describe Status, type: :model do
  before { status = Status.new(status: 'テスト条件') }

  it '条件がある場合、有効であること' do
    expect(status).to be_valid
  end

  it '条件がない場合、無効であること' do
    status.status = nil
    status.valid?
    expect(status.errors[:status]).to include("can't be blank")
  end

  it 'statusが一意でなければ無効であること' do
    status.save
    status_with_same_status = Status.new(status: 'テスト条件')
    status_with_same_status.valid?
    expect(status_with_same_status.errors[:status]).to include("has already been taken")
  end
end
