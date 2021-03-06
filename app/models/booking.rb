class Booking < ApplicationRecord
  STATUS_LIST = %w(pending rejected accepted cancelled_by_owner cancelled_by_biker paid active done)

  belongs_to :bike
  belongs_to :garage
  has_many :chats, -> { order(id: :asc) }, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_one :order

  validates :start_date, presence: true
  validates :status, inclusion: { in:  STATUS_LIST }
end
