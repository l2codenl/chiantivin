class AdminController < ApplicationController
  before_filter :authorize, :only => "index"

  def index
  end

  def login
  end

  def login_submit
    if params[:username] == "admin" && params[:password] == "welkom123"
      flash[:notice] = "Welcome."
      session[:admin] = true
      redirect_to admin_index_path
    else
      flash[:warning] = "Something went wrong."
      redirect_to login_admin_index_path
    end
  end
end
