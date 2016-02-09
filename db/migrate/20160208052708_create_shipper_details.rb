class CreateShipperDetails < ActiveRecord::Migration
  def change
    create_table :shipper_details do |t|
      t.string :fname
      t.string :lname
      t.string :email
      t.integer :mobile_no
      #t.references :shipper_address, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
