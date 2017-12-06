class ChargesController < ApplicationController
  def new
      @amount = session[:total]

  end

  def create
    # Amount in cents
    @cart_session = session[:c]
    @current_user = current_user

    @total = params[:total]

    @province_details = Province.where("id LIKE ?", @current_user.id).first


    @calc_gst = @total.to_f * @province_details.gst.to_f
    @calc_pst = @total.to_f * @province_details.pst.to_f
    @calc_hst = @total.to_f * @province_details.hst.to_f

    obj1 = Order.create(:status => "Paid", :pst => @calc_pst, :gst => @calc_gst, :hst => @calc_hst, :user_id => @current_user.id, :name => "Order_#{@current_user.id}" )
    obj1.save



    @cart_session.each do |each_array|
      each_array_id = each_array['id'].to_i
      each_quantity = each_array['quantity'].to_f
      product = Product.where('id = ?', each_array_id ).first
      @price = each_quantity* product.price

      obj2 = Lineitem.create(:price => @price, :quantity => each_quantity , :product_id => product.id, :order_id => obj1.id)
      obj2.save
    end


    @amount = session[:total]

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount.to_i,
      :description => 'Rails Stripe customer',
      :currency    => 'cad'
    )

    rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path




  end

  def update_order
  end
end
