class Chat < ApplicationRecord
  after_create :broadcast_message
  belongs_to :booking
  belongs_to :user

  validates :content, presence: true

  def from?(some_user)
    user == some_user
  end

  def broadcast_message
    ActionCable.server.broadcast("chat_room_#{booking.id}", {
      message_partial: ApplicationController.renderer.render(
        partial: "chats/chat",
        locals: { message: self, user_is_messages_author: false }
      ),
      current_user_id: user.id
    })
  end
end
