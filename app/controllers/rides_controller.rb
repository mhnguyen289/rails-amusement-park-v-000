class RidesController < ApplicationController

	def new 
		@user = User.find(session[:user_id])
		@ride = Ride.create(attraction_id: params[:attraction_id], user_id: @user.id)
		alert = @ride.take_ride
		redirect_to user_path(@user), :alert => alert
	end
end