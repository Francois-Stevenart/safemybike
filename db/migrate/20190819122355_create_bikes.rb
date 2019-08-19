class CreateBikes < ActiveRecord::Migration[5.2]
  def change
    create_table :bikes do |t|
      t.references :user, foreign_key: true
      t.string :type
      t.string :size
      t.integer :bike_tag
      t.string :bike_image

      t.timestamps
    end
  end
end
