class ShipperDetail < ActiveRecord::Base

  has_many :shipper_addresses , dependent: :destroy
  accepts_nested_attributes_for :shipper_addresses
end
