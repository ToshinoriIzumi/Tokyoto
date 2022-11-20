class Municipality::BaseController < ApplicationController
  layout 'municipality/layouts/application'
  before_action :require_login

  private
    def not_authenticated
      flash[:info] = 'ログインしてください'
      redirect_to main_app.login_path
    end
end