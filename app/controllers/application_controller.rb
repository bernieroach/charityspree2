class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

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
