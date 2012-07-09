class SettingsController < ApplicationController
  def index
    
  end
  def lang
    current_user.settings.lang = params[:lang]
    redirect_to root_path
  end

  def set_client_cookie

    if !params[:client_id].nil?

      if !cookies[:client_id] || cookies[:client_id] != params[:client_id]
        #session[:client_id]=params[:client_id]
        #response.set_cookie("client_id", params[:client_id])
        cookies[:client_id] = params[:client_id]
        render :text=>"ok"

      elsif cookies[:client_id] == params[:client_id]
        render :text=>"ok,ok"
      end
    end

  end

  def get_client_cookie
#    response.set_cookie("client_id","12345678")
#    cookies[:sss]="dddd"
#    puts request.cookies[:client_id]
#    puts cookies[:sss]
    puts cookies[:client_id]


    render :nothing=>true
  end
end
