class HospitalsController < ApplicationController
    skip_before_action :require_login
    def index
        @hospitals = Hospital.all
        render json: @hospitals
    end

    def search
        @hospitals = Hospital.search_by(params[:city_id])
        @city = City.find(params[:city_id])

        render json: {
            hospitals: @hospitals,
            center: {
                latitude: @city.latitude,
                longitude: @city.longitude
            }
        }
    end
end
