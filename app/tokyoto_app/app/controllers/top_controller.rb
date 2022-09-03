class TopController < ApplicationController
  before_action :set_q, only: [:index, :search]
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
    @q = Support.ransack(params[:q])
  end

end
