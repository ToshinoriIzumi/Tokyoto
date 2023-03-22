class ConditionsSupportsController < ApplicationController
    skip_before_action :require_login
    def search
        conditions_support_ids = ConditionsSupportsSearchService.search_by(
            params[:support_id], 
            params[:public_assistance], 
            params[:children_counts],
            params[:city_id]
        )
        render json: conditions_support_ids.uniq
    end
end
