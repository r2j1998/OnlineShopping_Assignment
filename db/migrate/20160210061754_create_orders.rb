class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :order_no
      t.integer :tracking_no
      t.date :delivery_date
      t.string :order_value
      t.string :amount
      t.string :delivery_type

      t.timestamps null: false
    end
  end
end
