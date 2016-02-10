class CreateItemLines < ActiveRecord::Migration
  def change
    create_table :item_lines do |t|
      t.integer :product_id
      t.integer :order_id

      t.timestamps null: false
    end
  end
end
