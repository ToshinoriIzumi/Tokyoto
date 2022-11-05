require 'rails_helper'

RSpec.describe Support, type: :model do
  it '支援名、支援内容、urlがあれば有効であること' do
    support = Support.new(
      support_name: 'support1',
      content: 'support1_content',
      url: 'https://www.support1.com',
    )
    expect(support).to be_valid
  end

  it '支援名がなければ無効であること' do
    support = Support.new(support_name: nil)
    support.valid?
    expect(support.errors[:support_name]).to include("can't be blank")
  end

  it '支援内容がなければ無効であること' do
    support = Support.new(content: nil)
    support.valid?
    expect(support.errors[:content]).to include("can't be blank")
  end

  it 'urlがなければ無効であること' do
    support = Support.new(url: nil)
    support.valid?
    expect(support.errors[:url]).to include("can't be blank")
  end

  # urlが重複したら無効にしたい…
  xit 'urlと支援名が重複していれば無効であること' do

  end
  # urlのチェックいる？ https~とか、pdfを参考リンクにしたい場合はない？
end
