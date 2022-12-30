class UserSessionsController < ApplicationController
  skip_before_action :require_login

  def new; end

  def create
    @user = login(params[:email], params[:password])
    if @user
      redirect_back_or_to top_index_path, notice: 'ログインしました'
      info_profile
    else
      flash.now[:alert] = 'ログインできませんでした'
      render :new
    end
  end

  def destroy
    logout
    redirect_to login_path, notice: 'ログアウトしました'
  end
end
