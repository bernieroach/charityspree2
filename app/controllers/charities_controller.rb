class CharitiesController < ApplicationController

  def index
    @charities = Charity.all
  end

  def show
    @charity = Charity.find(params[:id])
    @achievements = Achievement.all
    @donation = Donation.new
    @donation_number_stats = { 0_4 => 0, 5_9 => 0, 10_49 => 0, 50_99 => 0, 100 => 0 }
    @donation_quantity_stats = { 0_4 => 0, 5_9 => 0, 10_49 => 0, 50_99 => 0, 100 => 0 }
    require 'open-uri'
    url = "https://newsapi.org/v2/everything?q=\"#{@charity.name}\" &language=en&sortBy=relevancy&apiKey=#{ENV['NEWS_API_KEY']}"

    req = open(url)
    @news_json = req.read
    @news_json = JSON.parse(@news_json)
    puts
    if ( @news_json['articles'].count == 0 )
      url = "https://newsapi.org/v2/everything?q=#{@charity.name} &language=en&sortBy=relevancy&apiKey=#{ENV['NEWS_API_KEY']}"
      req = open(url)
      @news_json = req.read
      @news_json = JSON.parse(@news_json)
    end
    @news_articles = @news_json['articles']

    @charity.donations.each do | donation |
      case donation.quantity
        when 0..4
          @donation_number_stats[0_4] += 1
          @donation_quantity_stats[0_4] += donation.quantity
        when 4..9
          @donation_number_stats[5_9] += 1
          @donation_quantity_stats[5_9] += donation.quantity
        when 10..49
          @donation_number_stats[10_49] += 1
          @donation_quantity_stats[10_49] += donation.quantity
        when 50..99
          @donation_number_stats[50_99] += 1
          @donation_quantity_stats[50_99] += donation.quantity
        else
          @donation_number_stats[100] += 1
          @donation_quantity_stats[100] += donation.quantity
        end
    end
  end

end
