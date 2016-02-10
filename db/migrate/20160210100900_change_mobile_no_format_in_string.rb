class ChangeMobileNoFormatInString < ActiveRecord::Migration
  def change
  	change_column :customers, :mobile_no, :string
  end
end
