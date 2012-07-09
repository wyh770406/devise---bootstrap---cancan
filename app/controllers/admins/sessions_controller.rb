# app/controllers/sessions_controller.rb
class Admins::SessionsController < Devise::SessionsController
  # POST /resource/sign_in

  layout 'admin'
  def create

    super

    logger.info "Admin user:"+current_admin.name+", logged in at:"+Time.now.strftime("%Y-%m-%d %H:%M:%S")

  end

  # GET /resource/sign_out
  def destroy

    logger.info "Admin user:"+current_admin.name+", logged out at:"+Time.now.strftime("%Y-%m-%d %H:%M:%S")

    super

  end
end

