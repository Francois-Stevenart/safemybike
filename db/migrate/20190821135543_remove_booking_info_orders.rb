class RemoveBookingInfoOrders < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :booking_info
  end
end
