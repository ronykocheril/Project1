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
    @cart_session = session[:c]
    @current_user = current_user

    @total = params[:total]

    @province_details = Province.where("id LIKE ?", @current_user.id).first

    @calc_gst = @total.to_f * @province_details.gst.to_f
    @calc_pst = @total.to_f * @province_details.pst.to_f





  end

  def initialize_session
    session[:c] ||= []
  end
end
