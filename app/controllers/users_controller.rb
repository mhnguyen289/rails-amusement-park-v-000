
class UsersController < ApplicationController

	def home
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		@user.admin = false
		params[:user][:admin] == '1' ? @user.admin = true : @user.admin = false
		if @user.save
			session[:user_id] = @user.id 
			redirect_to user_path(@user)
		else
			render 'users/new' #back to sign up
		end
	end

	def show
		if session[:user_id].nil?
			redirect_to signup_path
		else
			@user = User.find(session[:user_id])
		end
		
	end

	private

		def user_params
			params.require(:user).permit(:name,:password,:height,:nausea,:happiness,:tickets)
		end


end