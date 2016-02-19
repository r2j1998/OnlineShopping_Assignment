class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    #raise params.inspect
  end
  def show_addresses
      
      @customer = Customer.find_by_email(params[:email])
      @addresses = @customer.addresses   
      respond_to :js 
  end
  def show_product
    
      @product = Product.find_by_product_name(params[:product_name])
      respond_to :js
  end

  # GET /orders/new
  def new
    @order = Order.new    
    @order.build_customer
    @order.build_address
  end

  # GET /orders/1/edit
  def edit
     @all_products =Product.all
      @item_lines = @order.item_lines  

  end

    def autocomplete_email    
      #availableCustomers = Customer.where('email LIKE ?' , "%#{params[:term]}%").pluck(:email)
      availableCustomers = Customer.where('email LIKE ?' , "%#{params[:term]}%").map(:email)   
      render json: availableCustomers  
    end
    def autocomplete_product
      availableProduct = Product.where('product_name LIKE ?' , "%#{params[:term]}%").pluck(:product_name)
      render json: availableProduct
    end

  # POST /orders
  # POST /orders.json
  def create
    
    #raise params.inspect
    @order = Order.new(order_params)

    respond_to do |format|
      if @order.save
        if params[:new_customer]=="true"
            Address.where( id: @order.address_id ).update_all( customer_id: @order.customer_id )
        end
          product_hash = params[:product_ids].split(',')
          product_hash.each do |product|

              if !product.to_s.empty?
                 @item_line = ItemLine.new(:order_id => @order.id , :product_id => product.to_i )
                 @item_line.save
              end
          end
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  # def order_type
    
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      #raise params.inspect
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.

    def order_params
       #raise params.inspect
        if params[:new_customer]=="true"        
          params.require(:order).permit(:order_no, :tracking_no, :delivery_date, :order_value, :amount, :delivery_type,  customer_attributes: [:email, :fname, :lname, :mobile_no, :birth_date] , address_attributes: [ :city, :district, :state, :country, :pincode] )                                
        else
              
          params['order'].merge!(:address_id => params['delivery_address'])
          params['order'].merge!(:customer_id => params['customer_id'])           
          params.require(:order).permit(:customer_id , :order_no, :tracking_no, :delivery_date, :order_value, :amount, :delivery_type ,  :address_id)
        end
      
     
    end
end
