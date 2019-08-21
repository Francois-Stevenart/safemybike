class ChatsController < ApplicationController
  def create
    @chat = Chat.new(chat_params)
    @chat.booking_id = params[:booking_id]
    @chat.user_id = params[:user_id]
    if @chat.save
      respond_to do |format|
        format.html { redirect_to user_garage_booking_path(current_user, params[:garage_id], params[:booking_id]) }
        format.js
      end
    else
      respond_to do |format|
        format.html { render 'bookings/show' }
        format.js
      end
    end
  end

  private

  def chat_params
    params.require(:chat).permit(:content)
  end
end
