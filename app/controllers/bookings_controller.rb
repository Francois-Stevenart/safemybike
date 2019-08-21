class BookingsController < ApplicationController
  before_action :set_booking, only: [:accept_request, :reject_request]

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.garage_id = params[:garage_id]
    @booking.save
    redirect_to user_garage_path(current_user, @booking.garage_id)
  end

  def accept_request
    @booking.status = "accepted"
    @booking.save ? (redirect_to user_dashboard_path(current_user)) : raise
  end

  def reject_request
    @booking.status = "rejected"
    @booking.save ? (redirect_to user_dashboard_path(current_user)) : raise
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :bike_id)
  end
end
