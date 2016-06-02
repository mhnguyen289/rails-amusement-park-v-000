class Ride < ActiveRecord::Base
	belongs_to :user
  belongs_to :attraction
  # write associations here

  def take_ride
  	@user = self.user
  	@attraction = self.attraction
  	if @user.tickets < @attraction.tickets && @user.height < @attraction.min_height
  		return "Sorry. You do not have enough tickets the #{@attraction.name}. You are not tall enough to ride the #{self.attraction.name}."
  	elsif @user.tickets < @attraction.tickets
  		return "Sorry. You do not have enough tickets the #{@attraction.name}."
  	elsif @user.height < @attraction.min_height
  		return "Sorry. You are not tall enough to ride the #{@attraction.name}."
  	else
  		@user.tickets -= @attraction.tickets
  		@user.nausea += @attraction.nausea_rating
  		@user.happiness += @attraction.happiness_rating
  			@user.save
  			return "Thanks for riding the #{@attraction.name}!"
  		end
	end
end
