class CartsController < ApplicationController

  def show
    @cart_lines = Cart.includes(:wine).find_all_by_session_id(session_id)
  end

  def create
    wine = Wine.find_by_url!(params[:wine_id])
    if cart = Cart.find(:first, :conditions => ["session_id = ? AND wine_id = ?", session_id, wine.id])
      cart.update_attribute(:quantity,cart.quantity + 1)
      flash[:notice] = t(:anotheradd, :scope => :cart ,:wine => wine.title)
    else
      Cart.create!(:wine => wine, :session_id => session_id, :quantity => 1)
      flash[:notice] = t(:add, :scope => :cart ,:wine => wine.title)
    end
    redirect_to cart_path
  end

  def destroy
    wine = Wine.find_by_url!(params[:wine_id])
    if cart_line = Cart.find_by_session_id_and_wine(session_id, wine)
      flash[:notice] = t(:remove, :scope => :cart ,:wine => wine.title) 
      cart_line.delete
    else
      flash[:warning] = t(:error) 
    end
    redirect_to cart_path
  end

  def update
    wine = Wine.find(params[:cart][:wine_id])
    quantity = params[:cart][:quantity]

    cart_line = Cart.find_by_session_id_and_wine(session_id, wine)
    if cart_line.update_attribute(:quantity,quantity)
      flash[:notice] = t(:quantity, :scope => :cart ,:wine => wine.title, :quantity => quantity)
    end

    redirect_to cart_path
  end

  private

  def session_id
    cookies[:session_id] ||= rand(16**36).to_s(36)
  end

end
