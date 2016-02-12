class Product < ActiveRecord::Base
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" } , default_url: "/images/medium/missing.jpeg"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  belongs_to :category 
  belongs_to :company 
  has_many :orders ,:through => :item_lines 

end
