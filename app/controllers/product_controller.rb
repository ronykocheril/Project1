class ProductController < ApplicationController


  def index
    @products = Product.all
  end

  def show
    @products = Product.all
    @categories = Category.all
    @item = params[:number]
    @category_name = Category.where("id = ?", @item).first
  end

  def search_display
    @search_item = params[:search_item]
    @category = params[:category]
    @products = Product.where("name LIKE '%#{@search_item}%'").where("category_id = ?", @category)


  end
end
