class ChargesController < ApplicationController
  def new
      @amount = session[:total]

  end

  def create
    # Amount in cents
    obj1 = Order.create(:status => "Paid", :pst => 8.0, :gst => 9.0, :hst => 5.6, :user_id => 1, :name => "name")
    obj1.save

    obj2 = Lineitem.create(:price => 20.0, :quantity => 2, :product_id => 3, :order_id => obj1.id)
    obj2.save

    @amount = session[:total]

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount.to_i,
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
    )

    rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path




  end

  def update_order
  end
end
