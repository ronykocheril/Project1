class CartController < ApplicationController
  before_action :initialize_session

  def index
    @cart_session = session[:c]
    @total = 0
  end

  def cart_display
    id = params[:id].to_i

    quantity = params[:quantity].to_i
    @quantity = params[:quantity].to_i

    if session[:c].any? {|hsh| hsh['id'] == id}
      session[:c].each do |val|
        if val['id'] == id
          val['quantity'] = quantity
        end
      end
    else
      session[:c] << {:id => id, :quantity => quantity}
    end

    redirect_to :action => :index
    # array_car = Array.new
    # array_car << {:id => id, :quantity => quantity}
    # session[:cart] << array_car
  end

  def delete_item_from_cart
    id = params[:id].to_i
    session[:c].each do |val|
      if val['id'] == id
        session[:c].delete(val)
      end
    end
    redirect_to :action => :index
  end

  def checkout
    @total = params[:total]

  end

  def initialize_session
    session[:c] ||= []
  end
end
