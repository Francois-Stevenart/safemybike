class BikesController < ApplicationController
  def new
  end

  def create
    @bike = Bike.new(bike_params)
    @bike.user_id = params[:user_id]
    @bike.save
    redirect_to user_garage_path(current_user, params[:garage][:garage_id])
  end

  private

  def bike_params
    params.require(:bike).permit(:name, :bike_size, :bike_type)
  end
end
