class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.references :category, index: true, foreign_key: true
      t.references :company, index: true, foreign_key: true
      t.string :product_name
      t.text :description
      t.float :price
      t.integer :quantity
      t.string :sku

      t.timestamps null: false
    end
  end
end
