class CartheadbandsController < ApplicationController
  def add_quantity
    cart_headband = CartHeadband.find(params[:cart_headband_id])
    @cart = current_user.carts.last
    cart_headband.quantity += 1
    cart_headband.save
    redirect_to cart_path(@cart)
  end

  def remove_quantity
    cart_headband = CartHeadband.find(params[:cart_headband_id])
    @cart = current_user.carts.last
    cart_headband.quantity -= 1
    cart_headband.save
    redirect_to cart_path(@cart)
  end

  def destroy
    cart_headband = CartHeadband.find(params[:id])
    @cart = current_user.carts.last
    cart_headband.destroy
    redirect_to cart_path(@cart)
  end
end
