class Bike < ApplicationRecord
  mount_uploader :bike_image, PhotoUploader

  belongs_to :user
  has_many :bookings
  has_many :reviews, through: :bookings

  validates :name, presence: true, uniqueness: true
  validates :size, inclusion: { in: %w(regular cargo) }
  validates :type, inclusion: { in: %w(electric non-electric) }
end
