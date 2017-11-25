class CartController < ApplicationController
  def index
  end

  def add_to_cart
    id = params[:id].to_i
    @product = Product.where('id = ?', id)
  end
end
