class OrdersController < ApplicationController
  def create
    order = params[:order]
    if check_values(order) 
      if check_email(order[:email])  
        if new_order = Order.create(order)
          new_order.cart = Cart.includes(:wine).find_all_by_session_id(session_id)
          Notifier.confirm_order(new_order)
          Notifier.send_to_chianti(new_order).deliver
          flash[:notice] = t(:create, :scope => :order)
          redirect_to success_cart_checkout_path
        else  
          flash[:warning] = t(:error, :scope => :order)
          redirect_to details_cart_checkout_path
        end
      else
          flash[:warning] = t(:email_error, :scope => :order)
          redirect_to details_cart_checkout_path
      end
    else
      flash[:error] = t(:value_error, :scope => :order)
      redirect_to details_cart_checkout_path
    end
  end

  private

  def session_id
    cookies[:session_id] ||= rand(16**36).to_s(36)
  end

  def check_values order
    order.each do | value |
      if value.nil? 
        return false
      end
    end
    return true
  end

  def check_email email
    return true 
  end
end
