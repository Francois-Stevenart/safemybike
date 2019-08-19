class AddColumnsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :payment_info, :string
    add_column :users, :profile_image, :string
    add_column :users, :street_number, :string
    add_column :users, :street, :string
    add_column :users, :city, :string
    add_column :users, :country, :string
  end
end
