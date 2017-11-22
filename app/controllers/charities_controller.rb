class CharitiesController < ApplicationController
  def index
    @charities = Charity.all
  end

  def show
    @charity = Charity.find(params[:id])
    @achievements = Achievement.all
    @donation = Donation.new

    require 'open-uri'
    url = "https://newsapi.org/v2/everything?"\
          "q=#{@charity.name}&language=en&sortBy=popularity&"\
          "apiKey=#{ENV['NEWS_API_KEY']}"
    req = open(url)
    @news_json = req.read
    @news_json = JSON.parse(@news_json)
    @news_json['articles'].each { | article | puts article['title']  }
    @news_articles = @news_json['articles']

  end
end
