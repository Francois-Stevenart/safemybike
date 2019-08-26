class UsersController < ApplicationController
  before_action :set_user, only: [:home, :show, :edit, :update, :mygarages, :mybookings, :addareview]

  def home
    @biker_pending_requests = @user.biker_bookings.where(status: %w(pending rejected accepted paid cancelled_by_owner))
    @owner_pending_requests = @user.owner_bookings.where(status: %w(pending rejected accepted paid cancelled_by_biker))
    @income_bookings = @user.owner_bookings.where(status: %w(paid active))
    @paying_bookings = @user.biker_bookings.where(status: %w(paid active))
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

  def addareview

  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :payment_info, :street, :street_number, :city, :country, :profile_image)
  end
end
