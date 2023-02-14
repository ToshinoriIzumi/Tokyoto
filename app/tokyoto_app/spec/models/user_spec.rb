require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @city = City.create(
      city_name: 'test区',
      latitude: 35.6130639,
      longitude: 139.6996014,
    )
    @user = User.new(
      user_name: 'test',
      email: 'test@example.com',
      password: 'password',
      password_confirmation: 'password',
      role: 0,
      income: '5000000',
      city_id: @city.id
      )
  end

  it '性、名、メールアドレス、role、パスワード、パスワード(確認)があれば有効であること' do
    expect(@user).to be_valid
  end

  it '姓がなければ無効であること' do
    @user.user_name = nil
    @user.valid?
    expect(@user.errors[:user_name]).to include("を入力してください")
  end

  it 'メールアドレスがなければ無効であること' do
    @user.email = nil
    @user.valid?
    expect(@user.errors[:email]).to include("を入力してください")
  end

  it '重複したメールアドレスならば無効であること' do
    @user.save
    another_user = User.new(
      user_name: 'test',
      email: 'test@example.com',
      password: 'password',
      password_confirmation: 'password',
      role: 0,
      income: '5000000',
      city_id: @city.id
      )
    another_user.valid?
    expect(another_user.errors[:email]).to include('はすでに存在します')
  end

  it 'パスワードがなければ無効であること' do
    @user.password = nil
    @user.valid?
    expect(@user.errors[:password]).to include("は3文字以上で入力してください")
  end

  it 'パスワード確認がなければ無効であること' do
    @user.password_confirmation = nil
    @user.valid?
    expect(@user.errors[:password_confirmation]).to include("を入力してください")
  end

  it 'パスワードが3文字以下ならば無効であること' do
    @user.password = 'pw'
    @user.password_confirmation = 'pw'
    @user.valid?
    expect(@user.errors[:password]).to include("は3文字以上で入力してください")
  end

  it 'パスワードとパスワード確認が同じでなければ無効であること' do
    @user.password_confirmation = 'password2'
    @user.valid?
    expect(@user.errors[:password_confirmation]).to include("とPasswordの入力が一致しません")
  end
end
