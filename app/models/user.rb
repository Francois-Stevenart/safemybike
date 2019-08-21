class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  mount_uploader :profile_image, PhotoUploader
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :bikes, dependent: :destroy
  has_many :garages, dependent: :destroy
  has_many :biker_bookings, source: :bookings, through: :bikes, dependent: :destroy
  has_many :owner_bookings, source: :bookings, through: :garages, dependent: :destroy
  has_many :chats, dependent: :destroy
  has_many :orders

  validates :first_name, :last_name, presence: true
  validates :email, presence: true, uniqueness: true
end
