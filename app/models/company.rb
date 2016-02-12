class Company < ActiveRecord::Base
	has_many :products
	validates_presence_of :company_name
	validates_uniqueness_of :company_name
end
