class StoreController < ApplicationController
  def index
    @categories = Category.all
    @items = Item.available_items
    @current_cart = current_user.current_cart unless current_user.nil?
  end
end
