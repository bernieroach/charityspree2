class DonationsController < ApplicationController
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


     Stripe::Charge.create(
        :amount      => @amount,
        :description => 'Custom donation',
        :source => params[:stripeToken],
        :currency    => 'cad'
      )

    @donation = Donation.new(
      user_id: current_user.id,
      charity_id: params[:charity_id],
      quantity: params[:amount]
    )
    @donation.save

    @charity = Charity.find(params[:charity_id]);
    new_amount = @charity.amount + params[:amount].to_i
    @charity.update_attributes(:amount => new_amount )
     UserAchievement.where(user_id: current_user.id).find_each do |userachievement|
      puts userachievement
      puts "id"
      puts userachievement.id
      puts "achievement id"
      puts userachievement.achievement_id
      puts "user id"
      puts userachievement.user_id
      puts "progress"
      puts userachievement.progress


      end

    redirect_to root_path
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_donate_path

  end
end
