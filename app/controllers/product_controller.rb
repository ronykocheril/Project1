class ProductController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @products = Product.all
    @categories = Category.all
    @item = params[:number]
  end
end
