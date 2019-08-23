class LinkBookingToOrder < ActiveRecord::Migration[5.2]
  def change
    add_reference :orders, :booking
  end
end
