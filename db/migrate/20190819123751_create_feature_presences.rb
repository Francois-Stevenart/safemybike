class CreateFeaturePresences < ActiveRecord::Migration[5.2]
  def change
    create_table :feature_presences do |t|
      t.references :garage, foreign_key: true
      t.references :feature, foreign_key: true

      t.timestamps
    end
  end
end
