class GaragesController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @garages = Garage.all
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

  def new
    @garage = Garage.new
  end

  def create
    @garage = Garage.new(garage_params)
    @garage.user_id = params[:user_id]
    @garage.save
    redirect_to user_garage_path(current_user, @garage)
  end

  def show
    @garage = Garage.find(params[:id])
    @booking = Booking.new
    @bike = Bike.new
    @markers = [@garage].map do |garage|
      {
        lat: garage.latitude,
        lng: garage.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { garage: garage }),
        image_url: helpers.asset_url("/map_marker.png")
      }
    end
  end

  def garage_params
    params.require(:garage).permit(
                                    :name,
                                    :description,
                                    :street_number,
                                    :street_address,
                                    :city,
                                    :country,
                                    :capacity_reg_bikes,
                                    :capacity_large_bikes,
                                    :price_regular_bike,
                                    :price_large_bike,
                                    :profile_image
                                  )
  end
end
