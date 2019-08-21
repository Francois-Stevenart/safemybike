class Booking < ApplicationRecord
  belongs_to :bike
  belongs_to :garage
  has_many :chats, dependent: :destroy

  validates :start_date, presence: true
  validates :status, inclusion: { in: %w(pending rejected accepted cancelled_request paid active done) }
end
