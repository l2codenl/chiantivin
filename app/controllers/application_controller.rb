class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :menu_pages

  def admin?
    cookies[:admin]
  end

  def authorize
    redirect_to login_admin_index_path unless admin?
  end

  def menu_pages
    @menu = Page.find_all_by_menu(true)
  end
end
