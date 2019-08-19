class AddNameToBikes < ActiveRecord::Migration[5.2]
  def change
    add_column :bikes, :name, :string
  end
end
