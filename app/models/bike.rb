class Bike < ApplicationRecord
  mount_uploader :bike_image, PhotoUploader

  belongs_to :user
  has_many :bookings, dependent: :destroy

  validates :name, presence: true
  validates :bike_size, inclusion: { in: %w(regular cargo) }
  validates :bike_type, inclusion: { in: %w(electric non-electric) }
end
