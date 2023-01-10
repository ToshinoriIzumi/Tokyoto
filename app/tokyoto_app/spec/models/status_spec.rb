require 'rails_helper'

RSpec.describe Status, type: :model do
  before { status = Status.new(status: "テスト条件") }

  it '条件がある場合、有効であること' do
    expect(status).to be_valid
  end

  it '条件がない場合、無効であること' do
    status.status = nil
    expect(conditions_supports_status).to be_invalid
    # status.valid?
    expect(status.errors[:status]).to include("can't be blank")
  end
end
