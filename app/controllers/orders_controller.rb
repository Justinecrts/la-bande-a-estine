class OrdersController < ApplicationController

  def create
    cart = Cart.find(params[:cart_id])
    if cart.order
      redirect_to order_path(cart.order)
    else
      amount = 0
      order = Order.create!(user: current_user, cart: cart, amount: cart.amount)
      redirect_to order_path(order)
    end
  end

  def show
    @order = Order.find(params[:id])
  end
end
