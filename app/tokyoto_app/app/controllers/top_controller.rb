class TopController < ApplicationController
  include ApplicationHelper
  before_action :set_query, only: [:index, :search, :get_selected_condition_supports]
  skip_before_action :require_login

  def index
    @supports = Support.all
  end

  def search
    @searched_condition_supports = @query_fix.result
      .select(:support_id)
      .distinct
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
    params[:query][:incomes_money_gt] =
      income_to_db(params[:query][:incomes_money_gt]) if !params[:query].nil?
    @query_fix = ConditionsSupport.ransack(params[:query])
  end
end
