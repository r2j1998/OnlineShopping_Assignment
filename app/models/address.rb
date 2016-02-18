class Address < ActiveRecord::Base
  belongs_to :customer, autosave: true 
  has_many :orders, :dependent => :destroy , autosave: true
  validates_presence_of :city , :district , :state , :pincode , :country
   validates_numericality_of :pincode, on: :create
end
