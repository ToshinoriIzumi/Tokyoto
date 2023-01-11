require 'rails_helper'

RSpec.describe Support, type: :model do
  before do
    support = Support.new(
    support_name: 'support1',
    content: 'support1_content',
    url: 'https://www.support1.com',
    )
  end

  it '支援名、支援内容、urlがあれば有効であること' do
    expect(support).to be_valid
  end

  it '支援名がなければ無効であること' do
    support.support_name = nil
    support.valid?
    expect(support.errors[:support_name]).to include("can't be blank")
  end

  it '支援内容がなければ無効であること' do
    support.content = nil
    support.valid?
    expect(support.errors[:content]).to include("can't be blank")
  end

  it 'urlがなければ無効であること' do
    support.url = nil
    support.valid?
    expect(support.errors[:url]).to include("can't be blank")
  end

  it '支援名が一意でなければ無効であること' do
    support.save
    support_with_same_support_name = Support.new(support_name: 'support1')
    support_with_same_support_name.valid?
    expect(support_with_same_support_name.errors[:support_name]).to include("has already been taken")
  end

  it 'urlが一意でなければ無効であること' do
    support.save
    support_with_same_url = Support.new(url: 'https://www.support1.com')
    support_with_same_url.valid?
    expect(support_with_same_url.errors[:url]).to include("has already been taken")
  end
end
