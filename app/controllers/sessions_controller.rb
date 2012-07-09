# app/controllers/sessions_controller.rb
class SessionsController < Devise::SessionsController
  # POST /resource/sign_in

  def create
    cookies[:sign_in] = "login"
   # cookies[:sign_out] = ""

    super

    logger.info "user:"+current_user.name+", logged in at:"+Time.now.strftime("%Y-%m-%d %H:%M:%S")
  end

  # GET /resource/sign_out
  def destroy
    logger.info "user:"+current_user.name+", logged out at:"+Time.now.strftime("%Y-%m-%d %H:%M:%S")
    cookies[:sign_in] = nil
   # cookies[:sign_out] = "logout"
    super

  end
end

