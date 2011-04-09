class WineriesController < ApplicationController
  def index
    redirect_to winery_path(Winery.first)
  end

  def show
    @winery = Winery.find_by_url!(params[:id])
    @wines = @winery.wines
  end
end
