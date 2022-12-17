class ApplicationController < ActionController::Base
  before_action :require_login

  def income_to_db(param)
    param.to_i * 10000
  end

  def income_to_view(data)
    data.to_i / 10000
  end

  private

  def not_authenticated
    flash[:info] = 'ログインしてください'
    redirect_to main_app.login_path
  end 
end
