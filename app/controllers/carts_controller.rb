class CartsController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: [:show]

  def show
  end

  def update
    @cart = Cart.find(session[:cart_id])
    if @cart.update(cart_params)
      redirect_to cart_path, success: 'Cart updated.'
    else
      render :show
    end
  end

  private

  def cart_params
    params.require(:cart).permit(line_items_attributes: [:quantity, :id])
  end
end
