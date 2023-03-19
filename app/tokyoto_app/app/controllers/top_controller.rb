class TopController < ApplicationController
  include ApplicationHelper
  before_action :set_query, only: [:index, :search, :show]
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
    @conditions_support = ConditionsSupport.new
    @cities = City.all
    @public_assistance = Status.load_public_assistance
    @children_counts = Status.load_children_counts
    @support = Support.find(params[:id])
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

  def set_conditions_supports_ids
    @conditions_supports_ids = []
    @ids.uniq.each {|id| @conditions_supports_ids.push(id) if @ids.grep(id).size > 1}
  end
end
