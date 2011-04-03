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
      flash[:notice] = "A new wine has been saved."
      redirect_to admin_wine_categories_path
    else
      flash[:warning] = "Something went wrong."
      redirect_to new_admin_wine_path
    end
  end

  def edit
    @wine = Wine.find_by_url(params[:id])
  end

  def update
    wine = Wine.find_by_url(params[:id])
    if wine.update_attributes(params[:wine])
      flash[:notice] = "A wine has been saved."
      redirect_to admin_wine_categories_path
    else
      flash[:warning] = "Something went wrong."
      redirect_to edit_admin_wine_path(wine)
    end
  end

  def destroy
    Wine.find_by_url(params[:id]).delete
    flash[:notice] = "The wine has been deleted."
    redirect_to admin_wine_categories_path
  end


end
