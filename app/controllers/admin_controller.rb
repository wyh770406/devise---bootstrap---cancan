class AdminController < ApplicationController
  before_filter :authenticate_admin!,:except=>[:index]

  layout "admin"
  def index
   # @resource = User.where("name = 'admin'").first
  end
end
