class CouponsController < ApplicationController
  # GET /coupons
  # GET /coupons.xml
  def index
    @coupons = Coupon.scopied

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @coupons }
    end
  end

  # GET /coupons/1
  # GET /coupons/1.xml
  def show
    @coupon = Coupon.scopied.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @coupon }
    end
  end

  # GET /coupons/new
  # GET /coupons/new.xml
  def new
    @coupon = Coupon.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @coupon }
    end
  end

  # GET /coupons/1/edit
  def edit
    @coupon = Coupon.scopied.find(params[:id])
  end

  # POST /coupons
  # POST /coupons.xml
  def create
    @coupon = Coupon.new(params[:coupon])
    @coupon.set_model_owner
    respond_to do |format|
      if @coupon.save
        format.html { redirect_to(@coupon, :notice => 'Coupon was successfully created.') }
        format.xml  { render :xml => @coupon, :status => :created, :location => @coupon }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @coupon.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /coupons/1
  # PUT /coupons/1.xml
  def update
    @coupon = Coupon.scopied.find(params[:id])
    @coupon.set_model_owner
    respond_to do |format|
      if @coupon.update_attributes(params[:coupon])
        format.html { redirect_to(@coupon, :notice => 'Coupon was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @coupon.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /coupons/1
  # DELETE /coupons/1.xml
  def destroy
    @coupon = Coupon.scopied.find(params[:id])
    @coupon.destroy if @coupon

    respond_to do |format|
      format.html { redirect_to(coupons_url) }
      format.xml  { head :ok }
    end
  end
  
  def coupons_list
    @coupons = Coupon.scopied
    render :text => @coupons.to_json
  end
end
