class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :product, index: true, foreign_key: true
      t.references :customer, index: true, foreign_key: true
      t.integer :quantity
      t.date :delivery_date
      t.string :status

      t.timestamps null: false
    end
  end
end
