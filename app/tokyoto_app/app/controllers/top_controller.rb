class TopController < ApplicationController
  before_action :set_q, only: [:index, :search]
  before_action :info_profile, only: [:index]
  skip_before_action :require_login

  def index
    @supports = Support.all
  end

  def search
    @results = @q.result
  end

  def show
    @support = Support.find(params[:id])
  end

  private
  def set_q
    @q = ConditionsSupport.ransack(params[:q])
  end

  def info_profile
    flash.now[:info] = '<a href="profile/edit">プロフィール</a>を登録すると、より便利な機能が使えます'.html_safe unless current_user.user_name
  end
end
