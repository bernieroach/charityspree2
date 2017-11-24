class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :check_for_cancel
  # before_action :authorize, only: [:show , :index]

  def index
    @users = if params[:term]
      User.where('first_name ILIKE ? OR last_name ILIKE ?', "%#{params[:term]}%", "%#{params[:term]}%")
    else
      User.all
    end
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @achievements  = Achievement.where('id NOT IN (SELECT achievement_id FROM user_achievements WHERE user_id = ?)', @user.id)
  end

  def create
    @user = User.new(user_params)

    @user.avatar = Faker::Avatar.image
    if @user.save
      UserNotifierMailer.send_signup_email(@user).deliver
      session[:user_id] = @user.id
      session[:time] = Time.now

      Achievement.all.find_each do |achievement|
        if achievement.id == 1
          @user.user_achievements.create!(progress: 0, achieved: true, achievement_id: achievement.id)
        else
          @user.user_achievements.create!(progress: 0, achieved: false, achievement_id: achievement.id)
        end
      end
      redirect_to @user
    else
     render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    puts "update user"
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



    def check_for_cancel
      puts "cancel check"
      if params[:commit_cancel] == "Cancel"
        redirect_to user_path
      end
    end
end
