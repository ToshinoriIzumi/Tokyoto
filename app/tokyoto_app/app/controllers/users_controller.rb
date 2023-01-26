class UsersController < ApplicationController
  skip_before_action :require_login

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      auto_login(@user)
      redirect_to new_profile_path, notice: 'ユーザー情報を登録しました'
      info_profile
    else
      flash.now[:alert] = 'ユーザー情報の登録に失敗しました。'
      render :new
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to :root, notice: '退会しました。'
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
