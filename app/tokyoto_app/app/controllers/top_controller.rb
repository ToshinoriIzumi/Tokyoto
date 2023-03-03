class TopController < ApplicationController
  include ApplicationHelper
  before_action :set_query, only: [:index, :search, :get_selected_condition_supports]
  skip_before_action :require_login

  def index
    @supports = Support.all
  end

  def search
    @results = @query_fix.result
    @results_distinct = @results.select(:support_id).distinct
  end

  def get_selected_condition_supports
    result_ids = params[:result_ids].map { |id| id.to_i }
    selected_support_id = params[:selected_support_id].to_i
    @ids = ConditionsSupport.where(support_id: selected_support_id).pluck(:id).to_a + result_ids
    set_conditions_supports_ids
    @conditions_supports = @conditions_supports_ids.map {|id| ConditionsSupport.find(id)}
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

  def set_conditions_supports_ids
    @conditions_supports_ids = []
    @ids.uniq.each {|id| @conditions_supports_ids.push(id) if @ids.grep(id).size > 1}
  end
end
