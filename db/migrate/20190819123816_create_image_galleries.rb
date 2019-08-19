class CreateImageGalleries < ActiveRecord::Migration[5.2]
  def change
    create_table :image_galleries do |t|
      t.references :garage, foreign_key: true
      t.string :image_url

      t.timestamps
    end
  end
end
