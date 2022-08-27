class TopPagesController < ApplicationController
  before_action :set_q, only: [:index, :search]

  def main
  end

  def search
    @results = @q.result
  end

  private

  def set_q
    @q = Support.ransack(params[:q])
  end

end
