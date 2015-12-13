class ProductsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_cart

  def index
    @products = Product.all
  end

  private

  def invalid_cart
    session[:cart_id] = nil
    redirect_to products_path, warning: 'Invalid cart.'
  end
end
