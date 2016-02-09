class ShippingAddress < ActiveRecord::Base
	belongs_to :customer
	has_one :order
end
