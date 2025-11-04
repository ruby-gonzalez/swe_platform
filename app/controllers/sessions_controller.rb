class SessionsController < ApplicationController
  def new # Displays the login form (by the view)
  end

  def create
    # STEP 1. Finding the user email
    user = User.find_by(email: params[:email])

    # STEP 2. Authenticating the user (happy path)
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id # This stores user ID in session (logs them in)
      redirect_to root_path, notice: "Logged in successfully!" # This redirects to homepage
    
    # STEP 3. Handle authentication failure (sad path)  
    else
      flash.now[:alert] = "Invalid email or password."
      render :new, status: :unprocessable_entity # Re-render form with error
    end
  end

  def destroy
    session[:user_id] = nil # Clear the session (logs them out)
    redirect_to root_path, notice: "Logged out successfully!"
  end
end
