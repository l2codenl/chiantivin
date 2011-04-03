class CartsController < ApplicationController

  def show
    @cart_lines = Cart.includes(:wine).find_all_by_session_id(session_id)
  end

  def create
    wine = Wine.find_by_url!(params[:wine_id])
    if cart = Cart.find(:first, :conditions => ["session_id = ? AND wine_id = ?", session_id, wine.id])
      cart.update_attribute(:quantity,cart.quantity + 1)
      flash[:notice] = "Another #{wine.title} has been added to your cart"
    else
      Cart.create!(:wine => wine, :session_id => session_id, :quantity => 1)
      flash[:notice] = "#{wine.title} has been added to your cart"
    end
    redirect_to cart_path
  end

  def destroy
    wine = Wine.find_by_url!(params[:wine_id])
    if cart_line = Cart.find_by_session_id_and_wine(session_id, wine)
      flash[:notice] = "#{cart_line.wine.title} has been removed from your cart"
      cart_line.delete
    else
      flash[:warning] = "Something went wrong"
    end
    redirect_to cart_path
  end

  private

  def session_id
    session[:session_id] ||= rand(16**36).to_s(36)
  end

end
