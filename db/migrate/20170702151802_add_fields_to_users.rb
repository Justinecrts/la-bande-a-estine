class AddFieldsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :phone, :string
    add_column :users, :place, :string
    add_column :users, :adress, :string
    add_column :users, :adress_complement, :string
    add_column :users, :postcode, :string
    add_column :users, :city, :string
  end
end
