class CheckoutsController < ApplicationController
  def success
  end

  def show
    @cart_lines = Cart.includes(:wine).find_all_by_session_id(session_id)
  end

  def details
    @order = Order.new
  end

  private

  def session_id
    cookies[:session_id] ||= rand(16**36).to_s(36)
  end
end
