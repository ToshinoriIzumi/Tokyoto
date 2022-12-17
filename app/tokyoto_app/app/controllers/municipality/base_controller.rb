class Municipality::BaseController < ApplicationController
  layout 'municipality/layouts/application'
  before_action :require_login

  private
    def not_authenticated
      flash[:info] = 'ログインしてください'
      redirect_to main_app.login_path
    end

    def check_admin
      redirect_to root_path, warning: '権限がありません' unless current_user.admin?
    end
end