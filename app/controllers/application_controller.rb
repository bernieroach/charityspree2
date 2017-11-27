class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_previous_url
  helper_method :previous_url




  def set_previous_url

    puts request.method

    if request.method ==  "GET"
puts "if passes"
 if session[:previous_url] != session[:current_url]
          session[:previous_url] = session[:current_url]
          session[:current_url] = request.url
else
            session[:previous_url] = charities_path
          session[:current_url] = request.url
end

puts "previous_url"
    puts session[:previous_url]
    puts "current_url"
    puts session[:current_url]

    end

  end

  def previous_url
    session[:previous_url]
  end

    def recent_activities
      @recent_donations = Donation.all.order(created_at: :desc).limit(5).map { | donation |
        puts "donation"
           { :id => donation.id,
             :activity => "Donation",
             :user_name => User.find(donation.user_id).first_name.strip,
             :charity_name => Charity.find(donation.charity_id).name.strip,
             :date => donation.created_at,
             :quantity => donation.quantity,
             :image => "donate.png" }
       }.sort! { | a,b | b[:created_at] <=> a[:created_at] }
      @recent_achievements = UserAchievement.where(achieved: true).order(updated_at: :desc).limit(5).map { | achievement |
        puts "achievment"

           { :id => achievement.id,
             :activity => "Achievement",
             :achievement => Achievement.find(achievement.achievement_id).title.strip,
             :user_name => User.find(achievement.user_id).first_name.strip,
             :date => achievement.updated_at,
             :quantity => achievement.progress,
             :image => Achievement.find(achievement.achievement_id).image }
       }.sort! { | a,b | b[:updated_at] <=> a[:updated_at] }


      if @recent_donations != nil
        @recent_activities = @recent_donations
      end
      if @recent_achievements != nil
            @recent_activities += @recent_achievements
      end
      @recent_activities.sort! { | a,b | b[:date] <=> a[:date] }

    end



  helper_method :recent_activities

  def current_user
    if session[:user_id]
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
