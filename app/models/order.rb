class Order < ActiveRecord::Base
	validates_presence_of :order_no, :tracking_no, :delivery_date, :order_value, :amount, :delivery_type
	validates_numericality_of :order_no, :tracking_no, :order_value, :amount
	

	has_many :item_lines,  autosave: true
	belongs_to :address, autosave: true
	belongs_to :customer , autosave: true
	has_many :products, :through => :item_lines

	accepts_nested_attributes_for :customer, :address, 
								  :reject_if => :all_blank,
           						  :allow_destroy => true
	
end
