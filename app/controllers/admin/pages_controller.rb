class Admin::PagesController < ApplicationController
  before_filter :authorize

  layout "admin"

  def index
    @pages = Page.all
  end

  def new
    @page = Page.new
  end

  def create
    page = Page.new(params[:page])
    if page.save 
      flash[:notice] = t(:create,:scope => :page)
      redirect_to admin_pages_path
    else
      flash[:warning] = t(:error)
      redirect_to new_admin_page_path
    end
  end

  def edit
    @page = Page.find(params[:id])
  end

  def update
    page = Page.find(params[:id])
    if page.update_attributes(params[:page])
      flash[:notice] = t(:update, :scope => :page)
      redirect_to admin_pages_path
    else
      flash[:warning] = t(:error)
      redirect_to edit_admin_page_path(page)
    end
  end

  def destroy
    page = Page.find(params[:id])
    if page.delete
      flash[:notice] = t(:delete, :scope => :page)
    else
      flash[:warning] = t(:error)
    end
    redirect_to admin_pages_path
  end

  def remove_banner
    page = Page.find(params[:id])
    page.update_attribute(:banner,nil)
    flash[:notice] = t(:deletebanner, :scope => :page)
    redirect_to edit_admin_page_path(page)
  end
end
