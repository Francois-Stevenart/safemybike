class AddDefaultToStatusBooking < ActiveRecord::Migration[5.2]
  def change
    change_column :bookings, :status, :string, :default => "penging"
  end
end
