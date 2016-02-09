class CreateShipperAddresses < ActiveRecord::Migration
  def change
    create_table :shipper_addresses do |t|
      t.string :city
      t.string :district
      t.string :state
      t.string :country
      t.integer :pincode
      t.references :shipper_detail, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
