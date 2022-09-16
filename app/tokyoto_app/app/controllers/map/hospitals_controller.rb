class Map::HospitalsController < ApplicationController
    def index
        @cities = City.all
    end
end
