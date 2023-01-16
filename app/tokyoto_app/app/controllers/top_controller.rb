class TopController < ApplicationController
  include ApplicationHelper
  before_action :set_query, only: [:index, :search]
  skip_before_action :require_login

  def index
    @supports = Support.all
  end

  def search
    @results = @query_fix.result
  end

  def show
    @support = Support.find(params[:id])
  end

  private
  
  def set_query
    @query = ConditionsSupport.ransack(params[:query])
    params[:query][:income_money_gt] = 
      income_to_db(params[:query][:income_money_gt]) if !params[:query].nil?
    @query_fix = ConditionsSupport.ransack(params[:query])
  end
end
