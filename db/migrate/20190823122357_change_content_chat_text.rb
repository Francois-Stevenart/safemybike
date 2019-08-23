class ChangeContentChatText < ActiveRecord::Migration[5.2]
  def change
    change_column :chats, :content, :string
  end
end
