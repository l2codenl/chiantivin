class Admin::WineCategoriesController < ApplicationController
  before_filter :authorize
  layout 'admin'

  def index
    @categories = WineCategory.all
  end

  def new
    @category = WineCategory.new
  end

  def create
    category = WineCategory.new(params[:wine_category])
    if category.save
      flash[:notice] = t(:create, :scope => [:wine,:category])
      redirect_to admin_wine_categories_path
    else
      flash[:warning] = t(:error)
      redirect_to new_admin_wine_category_path
    end
  end

  def update
    category = WineCategory.find(params[:id])
    if category.update_attributes(params[:wine_category])
      flash[:notice] = t(:update, :scope => [:wine,:category])
      redirect_to admin_wine_categories_path
    else
      flash[:warning] = t(:error)
      redirect_to edit_admin_wine_category_path(category)
    end
  end

  def edit
    @category = WineCategory.find(params[:id])
  end

  def destroy
    WineCategory.find(params[:id]).delete
    flash[:notice] = t(:delete, :scope => [:wine, :category])
    redirect_to admin_wine_categories_path
  end

  def remove_banner
    category = WineCategory.find(params[:id])
    category.update_attribute(:banner,nil)
    flash[:notice] = t(:deletebanner, :scope => [:wine, :category])
    redirect_to edit_admin_wine_category_path(category)
  end
end
