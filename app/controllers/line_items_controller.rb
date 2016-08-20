class LineItemsController < ApplicationController
  def create
    @current_cart = user_cart
    current_user.current_cart = @current_cart
    current_user.save

    item_id = params[:item_id].to_i

    item = @current_cart.line_items.detect { |li| li.item_id == item_id }

    if item.nil?
      @current_cart.line_items.create(item_id: item_id)
    else
      item.quantity += 1
      item.save
    end

    @current_cart.save
    redirect_to cart_path(@current_cart)
  end

  private

  def set_line_item(cart, item_id)
    # cart.line_items.detect { |li| li.item_id == item_id } || cart.line_items.create(item_id: item_id)
  end

  def user_cart
    current_user.current_cart ||= current_user.carts.create
  end
end
