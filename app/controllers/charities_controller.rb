class CharitiesController < ApplicationController
  def index
    @charities = Charity.all
  end

  def show
    @charity = Charity.find(params[:id])
    @achievements = Achievement.all
    @donation = Donation.new
  end
end
