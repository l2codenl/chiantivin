class Admin::WinesController < ApplicationController
  def new
    @categories = WineCategory.all
    @wine = Wine.new
  end

  def create
    #continue here.
  end

end
