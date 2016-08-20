class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :line_items
  has_many :items, through: :line_items

  def total
    line_items.collect { |i| i.item.price * i.quantity }.reduce(:+)
  end

  def add_item(item_id)
    item = Item.find_by_id(item_id)
    line_items.detect { |li| li.item == item } || LineItem.new(cart: self, item: item)
  end

  def checkout
    self.status = 'submitted'

    line_items.each do |li|
      reduce_inventory(li)
    end

    user.current_cart = nil
    user.save

    save
  end

  def reduce_inventory(line_item)
    item = Item.find_by_id(line_item.item_id)
    item.inventory -= line_item.quantity
    item.save
  end
end
