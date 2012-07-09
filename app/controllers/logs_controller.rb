class LogsController < ApplicationController
  skip_before_filter :verify_authenticity_token
  def index
    
  end

  def new
    @log = Log.new

  end

  def create
    
    @log = Log.new
    @log.from = params[:from]
    @log.cat = params[:cat]
    @log.msg = params[:msg]

    @log.save!
  end

  def logtofile
    logger.info params[:logstr]
    render :text=>"log to file luna.log is OK"
  end

end
