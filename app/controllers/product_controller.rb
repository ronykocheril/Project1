class ProductController < ApplicationController


  def index
    @products = Product.all
  end

  def show
    @categories = Category.all
    @item = params[:number]
    @products = Product.where("category_id = ?", @item)
    @category_name = Category.where("id = ?", @item).first

    
  end

  def search_display
    @search_item = params[:search_item]
    @category = params[:category]
    @products = Product.where("name LIKE '%#{@search_item}%'").where("category_id = ?", @category)

    @search_drop = params[:search_drop]
    if params[:search_drop] == ''
      @products = Product.where("category_id = ?", @category)
    else
      @products = Product.where("id LIKE '%#{@search_drop}%'").where("category_id = ?", @category)
    end
  end

  def sort
    @sort = params[:sort]
    @category = params[:category_id]
    @products = Product.where("status LIKE '#{@sort}'").where("category_id = ?", @category)
  end


end
