class WinesController < ApplicationController

  def show
    @wine = Wine.find_by_url!(params[:id])
  end

end
