class ChatsController < ApplicationController
  def create
    @chat = Chat.new(chat_params)
    @chat.booking_id = params[:booking_id]
    @chat.user_id = params[:user_id]
    @chat.save ? (redirect_to user_garage_booking_path(current_user, params[:garage_id], params[:booking_id])) : raise
  end

  private

  def chat_params
    params.require(:chat).permit(:content)
  end
end
