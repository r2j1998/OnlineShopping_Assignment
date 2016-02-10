class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :city
      t.string :district
      t.string :state
      t.string :country
      t.string :pincode
      t.references :customer, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
