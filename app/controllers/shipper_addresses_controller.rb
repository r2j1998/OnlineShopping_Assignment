class ShipperAddressesController < ApplicationController
  before_action :set_shipper_address, only: [:show, :edit, :update, :destroy]

  # GET /shipper_addresses
  # GET /shipper_addresses.json
  def index
    @shipper_addresses = ShipperAddress.all
  end

  # GET /shipper_addresses/1
  # GET /shipper_addresses/1.json
  def show
  end

  # GET /shipper_addresses/new
  def new
    @shipper_address = ShipperAddress.new
  end

  # GET /shipper_addresses/1/edit
  def edit
  end

  # POST /shipper_addresses
  # POST /shipper_addresses.json
  def create
    @shipper_address = ShipperAddress.new(shipper_address_params)

    respond_to do |format|
      if @shipper_address.save
        format.html { redirect_to @shipper_address, notice: 'Shipper address was successfully created.' }
        format.json { render :show, status: :created, location: @shipper_address }
      else
        format.html { render :new }
        format.json { render json: @shipper_address.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shipper_addresses/1
  # PATCH/PUT /shipper_addresses/1.json
  def update
    respond_to do |format|
      if @shipper_address.update(shipper_address_params)
        format.html { redirect_to @shipper_address, notice: 'Shipper address was successfully updated.' }
        format.json { render :show, status: :ok, location: @shipper_address }
      else
        format.html { render :edit }
        format.json { render json: @shipper_address.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shipper_addresses/1
  # DELETE /shipper_addresses/1.json
  def destroy
    @shipper_address.destroy
    respond_to do |format|
      format.html { redirect_to shipper_addresses_url, notice: 'Shipper address was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shipper_address
      @shipper_address = ShipperAddress.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shipper_address_params
      params.require(:shipper_address).permit(:city, :district, :state, :country, :pincode)
    end
end
