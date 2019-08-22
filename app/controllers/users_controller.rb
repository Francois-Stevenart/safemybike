class UsersController < ApplicationController
  before_action :set_user, only: [:home, :show, :edit, :update, :mygarages, :mybookings]

  def home
    @owner_pending_requests = @user.owner_bookings.where(status: %w(pending rejected accepted paid))
    @owner_in_progress_bookings = @user.owner_bookings.where(" status = ? OR status = ?  ", "accepted", "paid")
    @biker_in_progress_bookings = @user.biker_bookings.where(" status = ? OR status = ?  ", "accepted", "paid")
  end

  def show
  end

  def mygarages
    @garages = @user.garages
  end

  def mybookings
    @owner_bookings = @user.owner_bookings
    @biker_bookings = @user.biker_bookings
  end

  def edit
  end

  def update
    @user.update(user_params)
    if @user.save
      redirect_to user_dashboard_path(current_user)
    else
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :payment_info, :street, :street_number, :city, :country, :profile_image)
  end
end
