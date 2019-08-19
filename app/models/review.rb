class Review < ApplicationRecord
  belongs_to :booking

  def writer
    self.booking.bike.user
  end
end
