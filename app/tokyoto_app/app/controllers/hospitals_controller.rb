class HospitalsController < ApplicationController
    def index
        @hospitals = Hospital.all
        render json: @hospitals
    end

    def search
        @hospitals = Hospital.search_by(params[:city_id])
        render json: @hospitals
    end
end
