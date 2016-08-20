class CartsController < ApplicationController
  def show
    @cart = current_user.current_cart
    @cart = Cart.find_by_id(params[:id]) if @cart.nil?
  end

  def checkout
    @cart = current_user.current_cart
    @cart.checkout

    redirect_to cart_path(@cart)
  end
end
