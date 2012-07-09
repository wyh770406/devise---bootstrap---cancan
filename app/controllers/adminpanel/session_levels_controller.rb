# encoding: utf-8
class Adminpanel::SessionLevelsController < ApplicationController
  before_filter :authenticate_admin!
  layout 'admin'
  def index
    @session_levels = SessionLevel.all(:order=>"slevel_code asc")
    @min_slevel_code = SessionLevel.minimum('slevel_code')
    @max_slevel_code = SessionLevel.maximum('slevel_code')

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @session_levels }
    end
  end

  def show
    @session_level = SessionLevel.find(params[:id])
  end

  def new
    @session_level = SessionLevel.new
  end

  def create
    @session_level = SessionLevel.new(params[:session_level])
    max_slevel_code = SessionLevel.maximum('slevel_code')
    
    @session_level.slevel_code = "%03d" % (max_slevel_code.to_i + 1)
    respond_to do |format|
      if @session_level.save
        format.html { redirect_to adminpanel_session_level_path(@session_level), notice: 'session_level was successfully created.' }
        format.json { render json: @session_level, status: :created, location: @session_level }
      else
        format.html { render action: "new" }
        format.json { render json: @session_level.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @session_level = SessionLevel.find(params[:id])
  end

  def update
    @session_level = SessionLevel.find(params[:id])

    respond_to do |format|
      if @session_level.update_attributes(params[:session_level])
        format.html { redirect_to adminpanel_session_level_path(@session_level), notice: 'session_level was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @session_level.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    users = User.where(:session_level_id=>params[:id])
    if users.count == 0
      @session_level = SessionLevel.find(params[:id])
      del_slevel_code = @session_level.slevel_code
      @session_level.destroy
#      @update_session_levels = SessionLevel.where("slevel_code > ?", @session_level.slevel_code)
#
#      @update_session_levels.each do |update_session_level|
#        update_session_level.slevel_code = "%03d" % (update_session_level.slevel_code.to_i - 1)
#        update_session_level.save!
#      end

      SessionLevel.update_all("slevel_code=LPAD(slevel_code-1,3,'0')",["slevel_code > ?", del_slevel_code])


      respond_to do |format|
        format.html { redirect_to adminpanel_session_levels_url , notice:"succesfully deleted this session level" }
        format.json { head :no_content }
      end      
    else
      notice_words = "you can not delete the session_level as it is used by some else users!"
      respond_to do |format|
        format.html { redirect_to adminpanel_session_levels_url, alert:notice_words  }
        format.json { head :no_content }
      end
    end

  end

  def move_down
    @max_slevel_code = SessionLevel.maximum('slevel_code')
    @min_slevel_code = SessionLevel.minimum('slevel_code')


    current_session_level = SessionLevel.find(params[:id])
    @new_slevel_code = "%03d" % (current_session_level.slevel_code.to_i + 1)
    temp_slevel_code = "%05d" % 99999

    next_session_level = SessionLevel.where(:slevel_code=>@new_slevel_code).first
    if next_session_level.nil?
      render :nothing=>true
      return
    end
    next_session_level.slevel_code = temp_slevel_code#current_session_level.slevel_code
    next_session_level.save!
    temp_slevel_code = current_session_level.slevel_code
    @old_slevel_code = temp_slevel_code

    current_session_level.slevel_code = @new_slevel_code
    current_session_level.save!

    next_session_level.slevel_code = temp_slevel_code
    next_session_level.save!
    render :json=>{:last_slevel_id=>next_session_level.id,:new_slevel_code=>@new_slevel_code,:max_slevel_code=>@max_slevel_code,:min_slevel_code=>@min_slevel_code,:old_slevel_code=>@old_slevel_code}
#    if @new_slevel_code == @max_slevel_code
#      render :text=>"true"
#    else
#      render :text=>"false"
#    end
  end


  def move_up
    @max_slevel_code = SessionLevel.maximum('slevel_code')
    @min_slevel_code = SessionLevel.minimum('slevel_code')

    current_session_level = SessionLevel.find(params[:id])
    @new_slevel_code = "%03d" % (current_session_level.slevel_code.to_i - 1)
    temp_slevel_code = "%05d" % 99999

    prev_session_level = SessionLevel.where(:slevel_code=>@new_slevel_code).first

    if prev_session_level.nil?
      render :nothing=>true
      return
    end
    prev_session_level.slevel_code = temp_slevel_code#current_session_level.slevel_code
    prev_session_level.save!
    temp_slevel_code = current_session_level.slevel_code
    @old_slevel_code = temp_slevel_code

    current_session_level.slevel_code = @new_slevel_code
    current_session_level.save!

    prev_session_level.slevel_code = temp_slevel_code
    prev_session_level.save!
    render :json=>{:first_slevel_id=>prev_session_level.id,:new_slevel_code=>@new_slevel_code,:max_slevel_code=>@max_slevel_code,:min_slevel_code=>@min_slevel_code,:old_slevel_code=>@old_slevel_code}
  end
end
