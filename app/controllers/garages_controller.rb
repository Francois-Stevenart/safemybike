class GaragesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  def index
    @garages = Garage.all
  end

  def show
    @garage = Garage.find(params[:id])
    @booking = Booking.new
  end
end
