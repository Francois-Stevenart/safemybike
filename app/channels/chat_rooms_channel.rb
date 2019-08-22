class ChatRoomsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chat_room_#{params[:booking_id]}"
  end
end
