class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


    def recent_activities
      @donations = Donation.all.map { | donation |
        puts
           { :id => donation.id,
             :user_name => User.find(donation.user_id).first_name.strip,
             :charity_name => Charity.find(donation.charity_id).name.strip,
             :date => donation.created_at.to_date,

             :quantity => donation.quantity }
       }.sort! { | a,b | b[:id] <=> a[:id] }
    end



  helper_method :recent_activities

  def current_user
    if session[:user_id]
      puts "session user id"
      puts session[:user_id]
      if  @current_user = User.where(:id => session[:user_id]).empty?
        @current_user = nil
        session[:user_id] = nil
      else
         @current_user = User.find(session[:user_id])
      end
    else
     @current_user = nil
    end

  end

  helper_method :current_user

  def authorize
    redirect_to '/login' unless current_user
  end


end
