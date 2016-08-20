module StoreHelper
  def add_to_cart_button(item)
    button_to 'Add to Cart', line_items_path(item_id: item) if logged_in?
  end
end
