class ApplicationController < ActionController::Base

  include Log4luna::Logger
  before_filter :set_locale
  protect_from_forgery

#  def default_url_options(options={})
#    logger.debug "default_url_options is passed options: #{options.inspect}\n"
#    { :locale => I18n.locale }
#  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end

  private


  def set_locale

    logger.debug "param locale value: #{params[:locale]}\n"
    # if params[:locale] is nil then I18n.default_locale will be used
    
    I18n.locale = current_user.settings.lang  || 'cn' if current_user
  end

  def after_sign_out_path_for(resource_or_scope)
    request.referrer
  end
end
