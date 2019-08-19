class ImageGallery < ApplicationRecord
  mount_uploader :image_url, PhotoUploader
  belongs_to :garage

  validates :image_url, presence: true
end
