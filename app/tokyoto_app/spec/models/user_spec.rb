require 'rails_helper'

RSpec.describe User, type: :model do
  it '性、名、メールアドレス、role、パスワード、パスワード(確認)があれば有効であること' do
    user = User.new(
      first_name: 'user',
      last_name: 'test',
      email: 'test@example.com',
      role: 0,
      password: 'password',
      password_confirmation: 'password',
    )
    expect(user).to be_valid
  end

  it '性がなければ無効であること' do
    user = User.new(last_name: nil)
    user.valid?
    expect(user.errors[:last_name]).to include("can't be blank")
  end

  it '名がなければ無効であること' do
    user = User.new(first_name: nil)
    user.valid?
    expect(user.errors[:first_name]).to include("can't be blank")
  end

  it 'メールアドレスがなければ無効であること' do
    user = User.new(email: nil)
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end

  it '重複したメールアドレスならば無効であること' do
    User.create(
      first_name: 'user',
      last_name: 'test',
      email: 'test@example.com',
      role: 0,
      password: 'password',
      password_confirmation: 'password',
    )
    user = User.new(
      first_name: 'user2',
      last_name: 'test',
      email: 'test@example.com',
      password: 'password',
      password_confirmation: 'password',
    )
    user.valid?
    expect(user.errors[:email]).to include('has already been taken')
  end

  it 'roleがなければ無効であること' do
    user = User.new(role: nil)
    user.valid?
    expect(user.errors[:role]).to include("can't be blank")
  end

  it 'パスワードがなければ無効であること' do
    user = User.new(password: nil)
    user.valid?
    expect(user.errors[:password]).to include("is too short (minimum is 3 characters)")
    # can't be blankがerrorsオブジェクトにない。バリデーションでlength minimum 3を設定するとcan't be blankがなくなる？
  end

  it 'パスワード確認がなければ無効であること' do
    user = User.new(password_confirmation: nil)
    user.valid?
    expect(user.errors[:password_confirmation]).to include("can't be blank")
  end

  it 'パスワードが3文字以下ならば無効であること' do
    user = User.new(password: 'pw')
    user.valid?
    expect(user.errors[:password]).to include("is too short (minimum is 3 characters)")
  end

  it 'パスワードとパスワード確認が同じでなければ無効であること' do
    user = User.new(
      first_name: 'user',
      last_name: 'test',
      email: 'test@example.com',
      password: 'password',
      password_confirmation: 'password2',
    )
    user.valid?
    expect(user.errors[:password_confirmation]).to include("doesn't match Password")
  end
end
