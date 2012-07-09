# coding: UTF-8
require 'pp'

class Adminpanel::DevicesController < ApplicationController
  before_filter :authenticate_admin!
  layout 'admin' 
  def noregistration
    @noregistration_devices = NoregistrationDevice.where(:registration_status=>false)

  end

  def noregistration_detail
    @noregistration_device = NoregistrationDevice.find(params[:id])
  end

  def index
    @devices = Device.all
  end

  def show
    @device = Device.find(params[:id])
    @user = User.find(@device.user_id)
  end

  def new
    callno_pool = CallnoPool.where(:is_default=>true).first
    min_callno = callno_pool.start_callno
    max_callno = callno_pool.end_callno

    @rand_callno = [*min_callno..max_callno].sample
    if params[:noregistration_device_id]
      @noregistration_device = NoregistrationDevice.find(params[:noregistration_device_id])
      @device = Device.new
    else
      @device = Device.new
    end
  end

  def create
    @device = Device.new(params[:device])
    #创建默认用户
    email = params[:device][:callno]+'@example.com'
    exist_user = User.where(:name=>params[:device][:callno]).first
    if exist_user.nil?
      #查找普通用户会话等级
      session_level = SessionLevel.where(:slevel_name=>"普通用户").first
      exist_user = User.create! :name => params[:device][:callno],:device_sn => params[:device][:sn_no], :email => email,:session_level_id=>session_level.id, :password => "123456", :password_confirmation => "123456"
    end
    @device.user_id = exist_user.id

    
    respond_to do |format|
      if @device.save
        @device.users << exist_user
        if params[:noregistration_device_id]!="0"
          @noregistration_device = NoregistrationDevice.find(params[:noregistration_device_id])
          @noregistration_device.update_attributes!(:registration_status=>true)
        end
        format.html { redirect_to adminpanel_device_path(@device), notice: 'device was successfully created.' }
        format.json { render json: @device, status: :created, location: @device }
      else
        format.html { render action: "new" }
        format.json { render json: @device.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @device = Device.find(params[:id])
  end

  def update
    @device = Device.find(params[:id])

    respond_to do |format|
      if @device.update_attributes(params[:device])
        format.html { redirect_to adminpanel_device_path(@device), notice: 'device was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @device.errors, status: :unprocessable_entity }
      end
    end
  end

  def assign_user
    @device = Device.find(params[:id])

    @assigned = @device.users.sort {|x,y| y <=> x }

    @users = User.where("device_sn='' or id=?",@device.user_id).order("created_at desc")

    @unassigned = @users - @assigned
  end

  def assign
    @device = Device.find(params[:id])
    @user= User.find(params[:user_id])

    @device.users << @user
    redirect_to(assign_user_adminpanel_device_path(@device),:notice => "分配成功。")
  end

  def remove
    @device = Device.find(params[:id])
    @user= User.find(params[:user_id])

    @device.users.delete(@user)

    redirect_to(assign_user_adminpanel_device_path(@device),:notice => "移除成功。")
  end

  def destroy
    @device = Device.find(params[:id])
    @noregistration_device = NoregistrationDevice.where(:sn_no=>@device.sn_no).first
    if @noregistration_device
      @noregistration_device.registration_status = false

      @noregistration_device.save!
    end
    @device.destroy
    #@noregistration_device.update_attributes!(:registration_status=>false)
    respond_to do |format|
      format.html { redirect_to adminpanel_devices_url }
      format.json { head :no_content }
    end
  end


end
