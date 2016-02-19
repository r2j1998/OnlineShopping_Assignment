class Customer < ActiveRecord::Base
	validates_presence_of :fname ,:lname , :birth_date , :mobile_no, :email
	validates_uniqueness_of :email
	validates :mobile_no , :numericality => true,
                     	   :length => { :minimum => 10, :maximum => 10 } 

	has_many :addresses , :dependent => :destroy , autosave: true
	has_many :orders, :dependent => :destroy , autosave: true
	accepts_nested_attributes_for :addresses  , :orders , :reject_if => :all_blank, :allow_destroy => true
end
