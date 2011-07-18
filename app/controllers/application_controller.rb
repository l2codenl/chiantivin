class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :menu_pages
  helper_method :current_user

  def admin?
    session[:user_id]
  end

  def authorize
      redirect_to admin_log_in_path unless admin?
  end

  def menu_pages
    @menu = Page.find_all_by_menu(true)
  end

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

end
