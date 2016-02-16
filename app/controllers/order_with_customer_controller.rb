class OrderWithCustomerController < ApplicationController
  def index
  end

  def new
  	 @order = Order.new
     @all_products =Product.all
     @item_lines = @order.item_lines.build    
  end

  def create

  		raise params.inspect
  end
end
