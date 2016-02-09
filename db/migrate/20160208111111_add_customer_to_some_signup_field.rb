class AddCustomerToSomeSignupField < ActiveRecord::Migration
  def change
    add_column :customers, :fname, :string
    add_column :customers, :lname, :string
    add_column :customers, :mobile_no, :integer , :limit => 11
    add_column :customers, :birth_date, :date
  end
end
