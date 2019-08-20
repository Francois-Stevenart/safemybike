class AddCoordinatesToGarages < ActiveRecord::Migration[5.2]
  def change
    add_column :garages, :latitude, :float
    add_column :garages, :longitude, :float
  end
end
