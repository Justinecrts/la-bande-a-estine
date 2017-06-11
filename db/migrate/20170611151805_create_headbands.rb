class CreateHeadbands < ActiveRecord::Migration[5.0]
  def change
    create_table :headbands do |t|
      t.string :name
      t.integer :price
      t.integer :quantity
      t.text :description
      t.string :image_url
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
