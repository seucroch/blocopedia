class ChargesController < ApplicationController

  def new
  end

  def create
    # Amount in cents
    @amount = 500

    customer = Stripe::Customer.create(
      :email => 'example@stripe.com',
      :card  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Blocopedia Premium User',
      :currency    => 'usd'
    )

    current_user.upgrade_membership!
  

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to charges_path
  end

  
end
