class Adminpanel::CallnoPoolsController < ApplicationController
  before_filter :authenticate_admin!
  layout 'admin'
  def index
    @callno_pools = CallnoPool.all
  end

  def show
    @callno_pool = CallnoPool.find(params[:id])
  end

  def new
    @callno_pool = CallnoPool.new
  end

  def create
    @callno_pool = CallnoPool.new(params[:callno_pool])

    respond_to do |format|
      if @callno_pool.save
        format.html { redirect_to adminpanel_callno_pool_path(@callno_pool), notice: 'callno_pool was successfully created.' }
        format.json { render json: @callno_pool, status: :created, location: @callno_pool }
      else
        format.html { render action: "new" }
        format.json { render json: @callno_pool.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @callno_pool = CallnoPool.find(params[:id])
  end

  def update
     @callno_pool = CallnoPool.find(params[:id])

    respond_to do |format|
      if @callno_pool.update_attributes(params[:callno_pool])
        format.html { redirect_to adminpanel_callno_pool_path(@callno_pool), notice: 'callno_pool was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @callno_pool.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @callno_pool = CallnoPool.find(params[:id])
    @callno_pool.destroy

    respond_to do |format|
      format.html { redirect_to adminpanel_callno_pools_url }
      format.json { head :no_content }
    end
  end

  def set_default
    CallnoPool.update_all(:is_default=>false)
    @callno_pool = CallnoPool.find(params[:id])
    @callno_pool.update_attributes(:is_default=>true)
    render :nothing=>true
  end
end
