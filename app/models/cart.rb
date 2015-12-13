class Cart < ActiveRecord::Base
  has_many :line_items, dependent: :destroy
  accepts_nested_attributes_for :line_items

  def total_quantity
    line_items.any? ? line_items.map { |item| item.quantity }.reduce(:+) : 0
  end

  def add_product(product_id)
    current_item = line_items.find_by(product_id: product_id)
    if current_item
      current_item.quantity += 1
    else
      current_item = line_items.build(product_id: product_id)
    end
    current_item
  end

  def grand_total
    line_items.includes(:product).map { |item| item.product.price * item.quantity }.reduce(:+)
  end
end
