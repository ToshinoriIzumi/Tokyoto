require 'rails_helper'
require Rails.root.join('app/models/child.rb')

RSpec.describe ProfileForm, type: :model do
  let(:user) { create :user }
  let(:city) { create :city }

  it 'ProfileFormにbirthsに1つだけ誕生日を設定すると子供が1人だけ登録できる' do
    birth = '2020/01/01'
    profile_form = ProfileForm.new(
      id: user.id,
      city_id: city.id,
      income: 100,
      births: [ birth ]
    )
    profile_form.save
    expect(Child.count).to eq(1)
    child = Child.all.first
    expect(child.birth.strftime('%Y/%m/%d')).to eq(birth)
  end

  it 'ProfileFormにbirthsに2つ誕生日を設定すると子供が2人登録できる' do
    births = [ '2020/01/01', '2021/01/01']
    profile_form = ProfileForm.new(
      id: user.id,
      city_id: city.id,
      income: 100,
      births: births
    )
    profile_form.save
    expect(Child.count).to eq(2)
    Child.all.each_with_index do |child, index|
      expect(child.birth.strftime('%Y/%m/%d')).to eq(births[index])
    end
  end

  it 'ProfileFormにbirthsに1つ誕生日と空文字を設定すると子供が1人登録できる' do
    births = [ '2020/01/01', '']
    profile_form = ProfileForm.new(
      id: user.id,
      city_id: city.id,
      income: 100,
      births: births
    )
    profile_form.save
    expect(Child.count).to eq(1)
  end
end