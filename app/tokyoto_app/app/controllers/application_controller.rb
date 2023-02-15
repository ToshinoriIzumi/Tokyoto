class ApplicationController < ActionController::Base
  before_action :require_login

  private

  def not_authenticated
    flash[:info] = 'ログインしてください'
    redirect_to main_app.login_path
  end

  def info_profile
    unless @user.user_name
      flash[:info] = 'プロフィールを登録すると、より便利な機能が使えます'
    end
  end

end
