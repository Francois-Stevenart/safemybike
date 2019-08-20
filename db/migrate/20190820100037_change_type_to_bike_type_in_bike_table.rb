class ChangeTypeToBikeTypeInBikeTable < ActiveRecord::Migration[5.2]
  def change
    rename_column :bikes, :type, :bike_type
    rename_column :bikes, :size, :bike_size
  end
end
