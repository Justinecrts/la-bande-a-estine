class AddQuantityToCartHeadbands < ActiveRecord::Migration[5.0]
  def change
    add_column :cart_headbands, :quantity, :integer, :default => 1
  end
end
