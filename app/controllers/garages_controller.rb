class GaragesController < ApplicationController
  def index
    @garages = Garage.all
  end

  def show
    @garage = Garage.find(params[:id])
    @booking = Booking.new
  end
end
