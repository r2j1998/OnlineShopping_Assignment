class Customer < ActiveRecord::Base
	validates_presence_of :fname ,:lname , :birth_date , :mobile_no, :email
	 validates_numericality_of :mobile_no, on: :create
	validates_uniqueness_of :email
	validates :mobile_no , :numericality => true,
                     	   :length => { :minimum => 10, :maximum => 10 }

	has_many :addresses , :dependent => :destroy
	has_many :products
	has_many :orders
	has_many :item_lines
	accepts_nested_attributes_for :addresses  , :reject_if => :all_blank,
           												:allow_destroy => true
end
