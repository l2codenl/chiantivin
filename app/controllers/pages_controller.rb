class PagesController < ApplicationController
  def index
    @categories = WineCategory.find_all_by_menu(true)
  end

  def show
    @page = Page.first(:conditions => ['url = ?', params[:title].downcase])
    if @page.nil?
      redirect_to :root
    end
  end
end

