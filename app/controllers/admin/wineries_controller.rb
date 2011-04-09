class Admin::WineriesController < ApplicationController
  before_filter :authorize
  layout 'admin'

  def index
    @wineries = Winery.all
  end

  def new
    @winery = Winery.new
  end

  def create
    winery = Winery.new(params[:winery])
    if winery.save
      flash[:notice] = t(:create, :scope => [:wine,:winery])
      redirect_to admin_wineries_path
    else
      flash[:warning] = t(:error)
      redirect_to new_admin_wineries_path
    end
  end

  def edit
    @winery = Winery.find(params[:id])
  end

  def update
    winery = Winery.find(params[:id])
    if winery.update_attributes(params[:winery])
      flash[:notice] = t(:update, :scope => [:wine,:winery])
      redirect_to admin_wineries_path
    else
      flash[:warning] = t(:error)
      redirect_to edit_admin_winery_path(winery)
    end
  end

  def destroy
    Winery.find(params[:id]).delete
    flash[:notice] = t(:delete, :scope => [:wine, :winery])
    redirect_to admin_wineries_path
  end

  def remove_banner
    winery = Winery.find(params[:id])
    winery.update_attribute(:banner,nil)
    flash[:notice] = t(:deletebanner, :scope => [:wine, :winery])
    redirect_to edit_admin_winery_path(winery)
  end
end
