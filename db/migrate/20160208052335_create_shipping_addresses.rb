class CreateShippingAddresses < ActiveRecord::Migration
  def change
    create_table :shipping_addresses do |t|
      t.string :city
      t.string :district
      t.string :state
      t.string :country
      t.integer :pincode

      t.timestamps null: false
    end
  end
end
