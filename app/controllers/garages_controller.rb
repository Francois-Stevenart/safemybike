class GaragesController < ApplicationController
  def index
    @garages = Garage.geocoded #returns garages with coordinates

    @markers = @garages.map do |garage|
      {
        lat: garage.latitude,
        lng: garage.longitude
      }
    end
  end

  def show
  end
end
