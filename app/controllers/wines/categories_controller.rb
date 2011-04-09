class Wines::CategoriesController < ApplicationController
  def show
    @category = WineCategory.first(:conditions => ['url = ?', params[:title].downcase])
    if @category.nil?
      redirect_to :root
    else
      @wines = @category.wines.all
    end
    @current_category = @category
  end
end
