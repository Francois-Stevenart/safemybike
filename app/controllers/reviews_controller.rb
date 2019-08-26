class ReviewsController < ApplicationController
  def new
    @review = Review.new
    authorize @review
  end

  def create
    @review = Review.new(review_params)
    @review.booking = Booking.find(params["review"]["booking_id"])
    @review.save
    redirect_to user_garage_path(params[:user_id], params[:garage_id])
  end

  private

  def assign_message(content)
    @review_message = content
  end

  def review_params
    params.require(:review).permit(:rating, :content, :id)
  end
end
