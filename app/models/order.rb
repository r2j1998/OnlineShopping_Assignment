class Order < ActiveRecord::Base
	validates_presence_of :order_no ,:tracking_no ,:delivery_date,:order_value,:amount,:delivery_type
	validates_numericality_of :order_no , :tracking_no ,:order_value ,:amount
	

	has_many :item_lines  
	belongs_to :customer 
	has_many :products ,:through => :item_lines
	
end
