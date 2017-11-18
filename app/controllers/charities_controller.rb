class CharitiesController < ApplicationController
  def index
    @charities = Charity.all
  end
end
