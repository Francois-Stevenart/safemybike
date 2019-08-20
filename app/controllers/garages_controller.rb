class GaragesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
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
