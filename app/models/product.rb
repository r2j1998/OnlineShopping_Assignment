class Product < ActiveRecord::Base
	has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" } , default_url: "/images/medium/missing.png"

	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  	belongs_to :category
  	belongs_to :company

	def self.search(search)
  		if search
    		#find(:all, :conditions => [' product_name LIKE ?', "%#{search}%"])
    		where(' product_name LIKE ?', "%#{search}%")
  		else
    		find(:all)
  		end
	end
end
