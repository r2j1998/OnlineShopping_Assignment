class ShipperDetailsController < ApplicationController
  before_action :set_shipper_detail, only: [:show, :edit, :update, :destroy]

  # GET /shipper_details
  # GET /shipper_details.json
  def index
    @shipper_details = ShipperDetail.all
  end

  # GET /shipper_details/1
  # GET /shipper_details/1.json
  def show
  end

  # GET /shipper_details/new
  def new
    @shipper_detail = ShipperDetail.new
    @shipper_detail.shipper_addresses.build 
  end

  # GET /shipper_details/1/edit
  def edit
  end

  # POST /shipper_details
  # POST /shipper_details.json
  def create
    @shipper_detail = ShipperDetail.new(shipper_detail_params)

    respond_to do |format|
      if @shipper_detail.save
        format.html { redirect_to @shipper_detail, notice: 'Shipper detail was successfully created.' }
        format.json { render :show, status: :created, location: @shipper_detail }
      else
        format.html { render :new }
        format.json { render json: @shipper_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shipper_details/1
  # PATCH/PUT /shipper_details/1.json
  def update
    respond_to do |format|
      if @shipper_detail.update(shipper_detail_params)
        format.html { redirect_to @shipper_detail, notice: 'Shipper detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @shipper_detail }
      else
        format.html { render :edit }
        format.json { render json: @shipper_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shipper_details/1
  # DELETE /shipper_details/1.json
  def destroy
    @shipper_detail.destroy
    respond_to do |format|
      format.html { redirect_to shipper_details_url, notice: 'Shipper detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shipper_detail
      @shipper_detail = ShipperDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shipper_detail_params
      #raise params.inspect
      params.require(:shipper_detail).permit(:fname, :lname, :email, :mobile_no, shipper_addresses_attributes: [:city , :district , :state , :country , :pincode])
    end
end
