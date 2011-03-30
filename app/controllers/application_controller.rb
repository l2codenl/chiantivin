class ApplicationController < ActionController::Base
  protect_from_forgery

  def admin?
    session[:admin]
  end

  def authorize
    #redirect_to login_admin_index_path unless admin?
  end
end
