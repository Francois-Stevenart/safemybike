class BookingsController < ApplicationController
  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.garage_id = params[:garage_id]
    @booking.save
    redirect_to user_garage_path(current_user, @booking.garage_id)
  end

  def show
    @booking = Booking.find(params[:id])
    @garage = Garage.find(@booking.garage_id)
    @chat = Chat.new
    @chats = Chat.where(booking_id: @booking)
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :bike_id)
  end
end
