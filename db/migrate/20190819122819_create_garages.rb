class CreateGarages < ActiveRecord::Migration[5.2]
  def change
    create_table :garages do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.text :description
      t.integer :street_number
      t.string :street_address
      t.string :city
      t.string :country
      t.integer :capacity_reg_bikes
      t.integer :capacity_large_bikes
      t.string :profile_image
      t.integer :ratings

      t.timestamps
    end
  end
end
