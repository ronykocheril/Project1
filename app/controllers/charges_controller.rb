class ChargesController < ApplicationController
  def new
      @amount = session[:total]
  end

  def create
    # Amount in cents
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


    obj1 = Order.create(:status => "Paid", :pst => 8.0, :gst => 9.0, :hst => 5.6, :user_id => 1, :name => "name")
    obj1.save

  end

  def update_order
  end
end
