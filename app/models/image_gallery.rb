class ImageGallery < ApplicationRecord
  mount_uploader :image_url, PhotoUploader
  belongs_to :garage
end
