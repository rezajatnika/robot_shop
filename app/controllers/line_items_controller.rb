class LineItemsController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: [:create]

  def create
    @line_item = @cart.add_product(params[:product_id])
    if @line_item.save
      redirect_to cart_path, success: 'Item was added to current cart.'
    else
      render 'products/index'
    end
  end

  def destroy
    @line_item = LineItem.find(params[:id])
    @line_item.destroy
    redirect_to cart_path
  end
end
