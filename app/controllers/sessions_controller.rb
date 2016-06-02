class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find(params[:user][:id])
  	if user && user.authenticate(params[:password])
  		session[:user_id] = user.id
  		redirect_to user_path(user), notice: "Logged in successfully"
  	else
  		render signin_path, alert: "Invalid username/password combination"
  	end
  end

  def destroy
  	reset_session
  	redirect_to signin_path, notice: "You have been logged out"
  end
end
