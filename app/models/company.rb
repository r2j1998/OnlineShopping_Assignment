class Company < ActiveRecord::Base
  belongs_to :shipper_details
  has_many :products
end
