class ApplicationController < ActionController::Base
  before_action :require_login

  private
    def not_authenticated
      flash[:info] = 'ログインしてください'
      redirect_to main_app.login_path
    end
end
