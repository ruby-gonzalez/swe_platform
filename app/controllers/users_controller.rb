class UsersController < ApplicationController
  def new
    @user = User.new # Initialization of @user variable 
  end

  def create
    @user = User.new(user_params)
    @user.role = 'student' # Default role for new sign-ups

    if @user.save # Happy Path: Validation and Saving Successful
      session[:user_id] = @user.id # Immediately log the user in
      redirect_to root_path, notice: "Account created successfully! Welcome to the SWE Platform."
    else # Sad Path: Validation failed (password mismatch, email already taken)
      flash.now[:alert] = "Failed to create account. Please check the form errors."
      render :new, status: :unprocessable_entity
  end
end

private

  def user_params
    # Strong Parameters: only allow these fields to be submitted for security
    params.require(:user).permit(:email, :password, :password_confirmation, :role)
  end
end
