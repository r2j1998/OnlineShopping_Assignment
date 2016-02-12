class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :destroy]

  # GET /customers
  # GET /customers.json
  def index
    @customers = Customer.all
  end

  # GET /customers/1
  # GET /customers/1.json
  def show
  end

  # GET /customers/new
  def new
    @customer = Customer.new
    2.times{@customer.addresses.build}
      @customer.orders.build
  end

  # GET /customers/1/edit
  def edit
  end

  # POST /customers
  # POST /customers.json
  def create
    #raise params.inspect
    @customer = Customer.new(customer_params)
    #raise @customer.inspect
    respond_to do |format|
      if @customer.save

            save_item_lines(Order.last.id,params.require(:products))    
        format.html { redirect_to @customer, notice: 'Customer was successfully created.' }
        format.json { render :show, status: :created, location: @customer }
      else
        format.html { render :new }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customers/1
  # PATCH/PUT /customers/1.json
  def update
    respond_to do |format|
      if @customer.update(customer_params)
        format.html { redirect_to @customer, notice: 'Customer was successfully updated.' }
        format.json { render :show, status: :ok, location: @customer }
      else
        format.html { render :edit }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customers/1
  # DELETE /customers/1.json
  def destroy
    @customer.destroy
    respond_to do |format|
      format.html { redirect_to customers_url, notice: 'Customer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_params
      params.require(:customer).permit(:email, :fname, :lname, :mobile_no, :birth_date , addresses_attributes: [:city , :district , :state  , :pincode  , :country,:deliver_address], orders_attributes: [:order_no, :tracking_no, :delivery_date, :order_value, :amount, :delivery_type , products: [:product_id]])
    end
    def save_item_lines(order_id , product_hash)

    product_hash["id"].each do |product|

              if product.to_s.empty?
              else
                 @item_line = ItemLine.new(:order_id => order_id, :product_id => product.to_i )
                 @item_line.save
              end
    end
  end
end
