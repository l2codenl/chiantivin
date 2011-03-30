class WinesController < ApplicationController
  def show
    @wine = Wine.first(:conditions => ['url = ?', params[:title].downcase])
    if @wine.nil?
      redirect_to :root
    end
  end
end
