class RidesController < ApplicationController 
  def show
    @ride = Ride.find(params[:ride_id])
  end
end
