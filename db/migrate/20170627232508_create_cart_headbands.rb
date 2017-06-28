class CreateCartHeadbands < ActiveRecord::Migration[5.0]
  def change
    create_table :cart_headbands do |t|
      t.references :cart, foreign_key: true
      t.references :headbands, foreign_key: true

      t.timestamps
    end
  end
end
