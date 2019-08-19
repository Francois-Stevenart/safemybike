class Bike < ApplicationRecord
  mount_uploader :bike_image, PhotoUploader

  belongs_to :user
  has_many :bookings
  has_many :reviews, through: :bookings
end
