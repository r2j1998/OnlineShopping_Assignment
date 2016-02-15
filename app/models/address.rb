class Address < ActiveRecord::Base
  belongs_to :customer 
  has_many :orders, :dependent => :destroy
  validates_presence_of :city , :district , :state , :pincode , :country
   validates_numericality_of :pincode, on: :create
end
