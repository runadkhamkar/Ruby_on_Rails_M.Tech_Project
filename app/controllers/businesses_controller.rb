class BusinessesController < ApplicationController
  before_action :set_business, only: [:show, :destroy]

  # GET /businesses
  # GET /businesses.json
  def index
    @businesses = Business.where(customer_id:session[:customer_id])
  end
  def index2
    @businesses=Business.where(shop_id:session[:shop_id],status:'approved')
  end

  def notification
    #session[:business_id]=@business.id
    @businesses=Business.where(shop_id:session[:shop_id],status:'pending')
    #session[:business_id]=@business.id
  end
  def index1
    @business =Business.where.not(status:['approved','discarded'])

  end

  # GET /businesses/1
  # GET /businesses/1.json
  def show
    session[:business_id]=@business.id
    @shop=Shop.where(shopid:@business.shop_id)
  end
  def show1
    
    @business = Business.find(params[:id])
    session[:business_id]=@business.id
    @u=url_for(@business.image)
    @op=`tesseract #{@u} stdout`
  end
  def show3
    
    @business = Business.find(params[:id])
    session[:business_id]=@business.id
    bi=@business.image.download
    @u=rails_blob_path(@business.image)
    @op=`tesseract #{@u} stdout`
  end
  def download
    b=Business.find(params[:id])
    bi=b.image.download
    send_data bi

  end
  def show2
    
    @business = Business.find(params[:id])
    session[:shopid]=@business.shop_id
  end
  def choose
    @business=Business.find(params[:id])
    @business.status="wait"
    @business.save
  end

  def approve
    @business=Business.find(params[:id])
    @b=Business.where(unique_id:@business[:unique_id])
    @b.each do |b|
      if b.id == @business.id
        b.status="approved"
        b.save
        next
      end
      b.status="discarded"
      b.save
      
    end

    redirect_to '/index1'
  end

  # GET /businesses/new
  def new
    @business = Business.new
  end

  # GET /businesses/1/edit
  def edit
    @business=Business.find(params[:id])
    @f=`ls /home/runad/Downloads|head -n 1`
  end

  # POST /businesses
  # POST /businesses.json
  def create
    u=[session[:customer_id],DateTime.now]
    ud=u.join("/")
    @m=Shop.near(business_params[:address],50,:order=>:distance)
    for n in @m do
      @business = Business.new(business_params)
      @business.status="pending"
      @business.customer_id=session[:customer_id]
      @business.shop_id=n.id
      @business.unique_id=ud
      #respond_to do |format|
        if @business.save
          #redirect_to '/upload'
          #format.html { redirect_to @business, notice: 'Business was successfully created.' }
          #format.json { render :show, status: :created, location: @business }
        else
          #format.html { render :new }
          #format.json { render json: @business.errors, status: :unprocessable_entity }
        end
      end
      redirect_to businesses_url
  end
  

  # PATCH/PUT /businesses/1
  # PATCH/PUT /businesses/1.json
  def update
    
    @business=Business.find(session[:business_id])
    session[:business_id]=@business.id
    #respond_to do |format|
      if @business.update(business_params)
        redirect_to '/notification'
      else
        
      end
  end

  # DELETE /businesses/1
  # DELETE /businesses/1.json
  def destroy
    @business.destroy
    respond_to do |format|
      format.html { redirect_to businesses_url, notice: 'Business was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_business
      @business = Business.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def business_params
      params.require(:business).permit(:customer_id, :address, :latitude, :longitude, :status, :image, :shop_id)
    end
end
