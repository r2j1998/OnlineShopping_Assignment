class Product < ActiveRecord::Base
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" } , default_url: "medium/missing.jpg"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/


  validates_presence_of :product_name , :description , :price , :quantity , :sku , :lehgth , :width , :hieght , :weight
  validates_numericality_of :price , :quantity , :sku , :lehgth , :width , :hieght , :weight

  belongs_to :category 
  belongs_to :company 
  has_many :orders ,:through => :item_lines 
  

end
