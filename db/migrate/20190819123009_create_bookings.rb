class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.references :bike, foreign_key: true
      t.references :garage, foreign_key: true
      t.string :status
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
