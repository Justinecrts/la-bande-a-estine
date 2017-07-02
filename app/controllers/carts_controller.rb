class CartsController < ApplicationController

  def add_item
    headband = Headband.find(params[:headband_id])
    if current_user.carts.where(archived: false).size > 0
      @cart = current_user.carts.last
      @cart.cart_headbands.each do |cart_headband|
        if cart_headband.headband_id == headband.id
          cart_headband.quantity += 1
          cart_headband.save
        end
      end
      unless @cart.cart_headbands.any? {|c_h| c_h.headband_id == headband.id }
        cart_headband = CartHeadband.create!(cart: @cart, headband: headband)
        @cart.cart_headbands << cart_headband
      end
      redirect_to cart_path(@cart)
    else
      @cart = Cart.create!(user: current_user, amount: 0)
      cart_headband = CartHeadband.create!(cart: @cart, headband: headband)
      @cart.cart_headbands << cart_headband
      redirect_to cart_path(@cart)
    end
  end

  def show
    @cart = Cart.find(params[:id])
    @cart.cart_headbands.each do |cart_headband|
      @cart.amount += (cart_headband.headband.price * cart_headband.quantity)
    end
    @cart.save
  end
end





