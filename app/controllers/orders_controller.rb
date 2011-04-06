class OrdersController < ApplicationController
  def create
    if order = Order.create(params[:order])
      order.cart = Cart.includes(:wine).find_all_by_session_id(session_id)
      Notifier.confirm_order(order)
      Notifier.send_to_chianti(order).deliver
      flash[:notice] = "Your order has succesfully been send"
    end

    redirect_to success_cart_checkout_path
      #flash[:error] = ""
  end

  private

  def session_id
    cookies[:session_id] ||= rand(16**36).to_s(36)
  end
end
