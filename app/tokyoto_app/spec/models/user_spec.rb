require 'rails_helper'

RSpec.describe User, type: :model do
  it '性、名、メールアドレス、role、パスワード、パスワード(確認)があれば有効であること' do
    user = FactoryBot.build(:user)
    expect(user).to be_valid
  end

  it '姓がなければ無効であること' do
    user = FactoryBot.build(:user, last_name: nil)
    user.valid?
    expect(user.errors[:last_name]).to include("can't be blank")
  end

  it '名がなければ無効であること' do
    user = FactoryBot.build(:user, first_name: nil)
    user.valid?
    expect(user.errors[:first_name]).to include("can't be blank")
  end

  it 'メールアドレスがなければ無効であること' do
    user = FactoryBot.build(:user, email: nil)
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end

  it '重複したメールアドレスならば無効であること' do
    FactoryBot.create(:user)
    user = FactoryBot.build(:user)
    user.valid?
    expect(user.errors[:email]).to include('has already been taken')
  end

  xit 'roleがなければ無効であること' do
    user = FactoryBot.build(:user, role: nil)
    user.valid?
    expect(user.errors[:role]).to include("can't be blank")
  end

  it 'パスワードがなければ無効であること' do
    user = FactoryBot.build(:user, password: nil)
    user.valid?
    expect(user.errors[:password]).to include("is too short (minimum is 3 characters)")
  end

  it 'パスワード確認がなければ無効であること' do
    user = FactoryBot.build(:user, password_confirmation: nil)
    user.valid?
    expect(user.errors[:password_confirmation]).to include("can't be blank")
  end

  it 'パスワードが3文字以下ならば無効であること' do
    user = FactoryBot.build(:user, password: 'pw')
    user.valid?
    expect(user.errors[:password]).to include("is too short (minimum is 3 characters)")
  end

  it 'パスワードとパスワード確認が同じでなければ無効であること' do
    user = FactoryBot.build(:user, password_confirmation: 'password2')
    user.valid?
    expect(user.errors[:password_confirmation]).to include("doesn't match Password")
  end
end