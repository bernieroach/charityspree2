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

    UserAchievement.where(user_id: current_user.id).find_each do |userAchievement|
      achievement = Achievement.find(userAchievement.achievement_id)

      newProgress = userAchievement.progress + params[:amount].to_i
      newAchieve = userAchievement.achieved
      if newProgress >= achievement.progress
        newAchieve = true
      end
      userAchievement.update_attributes(
        :progress => newProgress,
        :achieved => newAchieve
      )

    end
    @user = User.find(current_user.id)
    redirect_to @user
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_donate_path

  end
end
