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
    @conditions_support = ConditionsSupport.find(params[:id])
  end

  def privacy_policy
  end

  def terms_of_use
  end

  private

  def set_query
    @query = ConditionsSupport.ransack(params[:query])
    params[:query][:income_search] =
      income_to_db(params[:query][:income_search]) if !params[:query].nil?
    @query_fix = ConditionsSupport.ransack(params[:query])
  end
end
