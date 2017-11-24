class SessionsController < ApplicationController

    def new
      if session[:user_id]
        redirect_to user
      else

      end
    end

    def create
    user = User.find_by_email(params[:session][:email])
    # If the user exists AND the password entered is correct.
    if user && user.authenticate(params[:session][:password])
      # Save the user id inside the browser cookie. This is how we keep the user
      # logged in when they navigate around our website.
      session[:user_id] = user.id
      session[:time] = Time.now
      redirect_to user
    else
    # If user's login doesn't work, send them back to the login form.
    flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    session[:time] = nil
    redirect_to root_path
  end


end
