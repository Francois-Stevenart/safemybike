class BookingsController < ApplicationController
  before_action :set_booking, only: [:accept_request, :reject_request, :cancel_request_by_owner, :cancel_request_by_biker, :destroy]

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @garage = Garage.find params[:garage_id]
    @booking.garage = @garage
    @booking.price = @booking.garage.price_large_bike if @booking.bike.bike_size == "cargo"
    @booking.price = @booking.garage.price_regular_bike if @booking.bike.bike_size == "regular"
    if @booking.save
      render json: { message: "booking created" }, status: 200
    else
      render json: { message: "booking couldnt be saved" }, status: 400
    end
  end

  def show
    @booking = Booking.find(params[:id])
    @user = current_user
    @garage = Garage.find(@booking.garage_id)
    @chat = Chat.new
    @chats = Chat.where(booking_id: @booking).order(id: :desc)
  end

  def accept_request
    @booking.status = "accepted"
    @booking.save ? (redirect_to request.referrer) : raise
  end

  def reject_request
    @booking.status = "rejected"
    @booking.save ? (redirect_to request.referrer) : raise
  end

  def cancel_request_by_owner
    @booking.status = "cancelled_by_owner"
    @booking.save ? (redirect_to request.referrer) : raise
  end

  def cancel_request_by_biker
    @booking.status = "cancelled_by_biker"
    @booking.save ? (redirect_to request.referrer) : raise
  end

  def destroy
    @booking.destroy ? (redirect_to request.referrer) : raise
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :bike_id)
  end
end
