class ChangeIntegerToIntegerArrayInGarageTable < ActiveRecord::Migration[5.2]
  def change
    remove_column :garages, :ratings, :integer
  end
end
