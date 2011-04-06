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
      flash[:notice] = "The new page has been saved."
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
      flash[:notice] = "The page has been updated."
      redirect_to admin_pages_path
    else
      flash[:warning] = t(:error)
      redirect_to edit_admin_page_path(page)
    end
  end

  def destroy
    page = Page.find(params[:id])
    if page.delete
      flash[:notice] = "The page has been deleted."
    else
      flash[:warning] = t(:error)
    end
    redirect_to admin_pages_path
  end

  def remove_banner
    page = Page.find(params[:id])
    page.update_attribute(:banner,nil)
    flash[:notice] = "The page banner has been deleted"
    redirect_to edit_admin_page_path(page)
  end
end
