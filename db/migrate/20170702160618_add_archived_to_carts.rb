class AddArchivedToCarts < ActiveRecord::Migration[5.0]
  def change
    add_column :carts, :archived, :boolean, :default => false
  end
end
