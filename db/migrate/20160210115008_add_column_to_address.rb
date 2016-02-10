class AddColumnToAddress < ActiveRecord::Migration
  def change
    add_column :addresses, :deliver_address, :boolean , :default => false
  end
end
