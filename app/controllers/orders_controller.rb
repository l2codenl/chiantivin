class OrdersController < ApplicationController
  def create
    order = params[:order]
    if check_values order
      if check_email order[:email]
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
      flash[:warning] = t(:value_error, :scope => :order)
      redirect_to details_cart_checkout_path
    end
  end

  private

  def session_id
    cookies[:session_id] ||= rand(16**36).to_s(36)
  end

  def check_values order
    order.each do | key, value |
      if value.empty? 
        return false
      end
    end
    return true
  end

  def check_email email
    email_regex = %r{
        ^ # Start of string
        [0-9a-z] # First character
        [0-9a-z.+]+ # Middle characters
        [0-9a-z] # Last character
        @ # Separating @ character
        [0-9a-z] # Domain name begin
        [0-9a-z.-]+ # Domain name middle
        [0-9a-z] # Domain name end
        $ # End of string
      }xi # Case insensitive
      
      if email =~ email_regex
        return true
      else
        return false
      end
  end
end

