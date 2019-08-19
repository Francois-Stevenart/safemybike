class Chat < ApplicationRecord
  belongs_to :booking
  belongs_to :user

  validates :content, presence: true
end
