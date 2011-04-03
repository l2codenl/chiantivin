class CartsController < ApplicationController

  def show
    @cart_lines = Cart.includes(:wine).find_all_by_session_id(session_id)
  end

  def create
    wine = Wine.find_by_url!(params[:wine_id])
    Cart.create!(:wine => wine, :session_id => session_id)
    redirect_to cart_path, :notice => "#{wine.title} has been added to your cart"
  end

  private

  def session_id
    session[:session_id] ||= rand(16**36).to_s(36)
  end

end
