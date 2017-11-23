class UsersController < ApplicationController

  before_action :authorize, only: [:show , :index]

  def index
    puts "searching..."
    @users = if params[:term]
      puts "searching for user ..."
      puts @users.inspect
      User.where('first_name ILIKE ? OR last_name ILIKE ?', "%#{params[:term]}%", "%#{params[:term]}%")
    else
      puts "No search term found"
      User.all
    end
  end

  def new
  end

  def show
    @user = User.find(params[:id])
    @achievements  = Achievement.where('id NOT IN (SELECT achievement_id FROM user_achievements WHERE user_id = ?)', @user.id)
  end

  def create
    user = User.new(user_params)
    user.avatar = Faker::Avatar.image
    if user.save
      session[:user_id] = user.id

      Achievement.all.find_each do |achievement|
        if achievement.id == 1
          user.user_achievements.create!(progress: 0, achieved: true, achievement_id: achievement.id)
        else
          user.user_achievements.create!(progress: 0, achieved: false, achievement_id: achievement.id)
        end
      end

      redirect_to '/'
    else
      redirect_to '/signup'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to @user
      # Handle a successful update.
    else
      render 'edit'
    end
  end

  private
    def user_params
      params.require(:user)
      .permit(  :first_name,
                :last_name,
                :email,
                :password,
                :password_confirmation)
    end
end
