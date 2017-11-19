class HomeController < ApplicationController
  def index
    @categories = Category.order(:name).page(params[:page]).per(4)
  end

  def search_display
    @search_item = params[:search_item]
    @categories = Category.where("name LIKE '%#{@search_item}%'")
  end
end
