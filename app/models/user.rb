class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :bikes, dependent: :destroy
  has_many :garages, dependent: :destroy
  has_many :biker_bookings, as: :bookings, through: :bikes, dependent: :destroy
  has_many :owner_bookings, as: :bookings, through: :garages, dependent: :destroy
  has_many :chats, dependent: :destroy
end
