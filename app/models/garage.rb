class Garage < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews, through: :bookings
  has_many :feature_presences, dependent: :destroy
  has_many :features, through: :feature_presences
  has_many :image_galleries, dependent: :destroy
end
