class Garage < ApplicationRecord
  mount_uploader :profile_image, PhotoUploader
  monetize :price_regular_bike_cents
  monetize :price_large_bike_cents

  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings
  has_many :feature_presences, dependent: :destroy
  has_many :features, through: :feature_presences
  has_many :image_galleries, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :description, :street_number, :street_address, :city, :country, presence: true
  validates :capacity_reg_bikes, :capacity_large_bikes, presence: true, numericality: { only_integer: true }

  geocoded_by :address
  after_validation :geocode
  # , if: :will_save_change_to_address?

  def address
    street = [street_address, street_number].compact.join(' ')
    [street, city, country].compact.join(', ')
  end
end
