class UsersController < ApplicationController

  before_action :authorize, only: [:show , :index]

  def new
  end

  def show
    @user = User.find(params[:id])
    @achievements  = Achievement.where('id NOT IN (SELECT achievement_id FROM user_achievements WHERE user_id = ?)', @user.id)
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
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
      flash[:success] = "Profile updated"
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
