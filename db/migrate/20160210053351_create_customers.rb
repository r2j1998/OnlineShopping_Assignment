class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :email
      t.string :fname
      t.string :lname
      t.integer :mobile_no
      t.date :birth_date

      t.timestamps null: false
    end
  end
end
