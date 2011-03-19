class PagesController < ApplicationController
  def index
  end

  def show
    @page = Page.first(:conditions => ['url = ?', params[:title].downcase])
    if @page.nil?
      redirect_to :root
    end
  end
end

