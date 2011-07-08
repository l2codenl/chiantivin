class WineriesController < ApplicationController
  def index
    if !Winery
      redirect_to winery_path(Winery.first)
    end
  end

  def show
    @winery = Winery.find_by_url!(params[:id])
    @wines = @winery.wines
  end
end
