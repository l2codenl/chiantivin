class WinesController < ApplicationController
  def index
    @categories = WineCategory.all
  end

  def show
    @wine = Wine.find_by_url!(params[:id])
    @current_category = @wine.wine_category_id
  end

end
