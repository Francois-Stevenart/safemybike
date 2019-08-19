class Booking < ApplicationRecord
  belongs_to :bike
  belongs_to :garage
  has_many :chats, dependent: :destroy

  validates :start_date, :end_date, presence: true
  validates :status, inclusion: { in: %w(pending rejected accepted paid active done) }
end
