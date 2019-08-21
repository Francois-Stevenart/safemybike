class BookingsController < ApplicationController
  before_action :set_booking, only: [:accept_request, :reject_request, :cancel_request, :destroy]

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

  def accept_request
    @booking.status = "accepted"
    @booking.save ? (redirect_to dashboard_home_user_path(current_user)) : raise
  end

  def reject_request
    @booking.status = "rejected"
    @booking.save ? (redirect_to dashboard_home_user_path(current_user)) : raise
  end

  def cancel_request
    @booking.status = "cancelled_request"
    @booking.save ? (redirect_to dashboard_home_user_path(current_user)) : raise
  end

  def destroy
    @booking.destroy ? (redirect_to dashboard_home_user_path(current_user)) : raise
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :bike_id)
  end
end
