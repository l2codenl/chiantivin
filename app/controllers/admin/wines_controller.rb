class Admin::WinesController < ApplicationController
  before_filter :authorize
  layout "admin"

  def new
    @categories = WineCategory.all
    @wine = Wine.new
  end

  def create
    category = WineCategory.find(params[:wine_category][:id])
    wine = category.wines.new(params[:wine])
    if wine.save
      flash[:notice] = t(:create, :scope => :wine)
      redirect_to admin_wine_categories_path
    else
      flash[:warning] = t(:error)
      redirect_to new_admin_wine_path
    end
  end

  def edit
    @wine = Wine.find(params[:id])
  end

  def update
    wine = Wine.find(params[:id])
    if wine.update_attributes(params[:wine])
      flash[:notice] = t(:update, :scope => :wine, :title => wine.title)
      redirect_to admin_wine_categories_path
    else
      flash[:warning] = t(:error)
      redirect_to edit_admin_wine_path(wine)
    end
  end

  def destroy
    Wine.find(params[:id]).delete
    flash[:notice] = t(:delete, :scope => :wine)
    redirect_to admin_wine_categories_path
  end


end
