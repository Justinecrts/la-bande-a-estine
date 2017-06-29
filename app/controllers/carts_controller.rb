class CartsController < ApplicationController

  def add_item
    if current_user.carts.size > 0
      @cart = current_user.carts.last
    else
      @cart = Cart.create!(user: current_user, amount: 0)
    end
    headband = Headband.find(params[:headband_id])
    cart_headband = CartHeadband.create!(cart: @cart, headband: headband)
    @cart.cart_headbands << cart_headband
    redirect_to cart_path(@cart)
  end

  def show
    @cart = Cart.find(params[:id])
    @cart.cart_headbands.each do |cart_headband|
      @cart.amount += cart_headband.headband.price
      puts "price#{@cart.amount}"
    end
  end
end





