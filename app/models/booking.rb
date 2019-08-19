class Booking < ApplicationRecord
  belongs_to :bike
  belongs_to :garage
  has_many :chats, dependent: :destroy
end
