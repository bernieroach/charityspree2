class DonatesController < ApplicationController
  before_action :authorize
  def new
  end

  def create
    @amount = params[:amount]

    @amount = @amount.gsub('$', '').gsub(',', '')

    begin
      @amount = Float(@amount).round(2)
    rescue
      flash[:error] = 'Charge not completed. Please enter a valid amount in CAD ($).'
      redirect_to new_donate_path
      return
    end

    @amount = (@amount * 100).to_i # Must be an integer!

require "stripe"


  # Amount in cents
  @amount = 500


  charge = Stripe::Charge.create(
    :source    => params[:stripeToken],
    :amount      => @amount,
    :description => 'Rails Stripe customer',
    :currency    => 'usd'
  )
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_donate_path
  end
end
