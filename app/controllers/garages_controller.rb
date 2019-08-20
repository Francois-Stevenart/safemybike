class GaragesController < ApplicationController
  def index
    @garages = Garage.geocoded #returns garages with coordinates

    @markers = @garages.map do |garage|
      {
        lat: garage.latitude,
        lng: garage.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { garage: garage }),
        image_url: helpers.asset_url('/map_marker.png')
      }
    end
  end

  def show
  end
end
