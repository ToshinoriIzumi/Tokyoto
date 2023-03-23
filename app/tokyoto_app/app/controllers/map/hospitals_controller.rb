class Map::HospitalsController < ApplicationController
    skip_before_action :require_login 
    def index
        @cities = City.all
    end
end
