class WinesController < ApplicationController
  def index
    @categories = WineCategory.all
  end

  def show
    @wine = WineCategory.find_by_url(params[:category]).wines.find_by_url!(params[:id])
    @current_category = @wine.wine_category
  end

end
