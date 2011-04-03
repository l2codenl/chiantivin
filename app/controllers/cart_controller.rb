class CartController < ApplicationController
  def add_to
    cart = Cart.find(params[:id])
  end
end
