class CreateFeatures < ActiveRecord::Migration[5.2]
  def change
    create_table :features do |t|
      t.string :name
      t.text :description
      t.string :icon_image

      t.timestamps
    end
  end
end
