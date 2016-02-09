class AddIndexToShippingAddress < ActiveRecord::Migration
  def change
    add_reference :shipping_addresses, :customer, index: true, foreign_key: true
  end
end
