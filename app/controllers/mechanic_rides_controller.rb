class MechanicRidesController < ApplicationController 
  def create 
    mechanic = Mechanic.find(params[:mechanic_id])
    ride =  Ride.find_by(id: params[:id])
    MechanicRide.create(mechanic: mechanic, ride: ride)
    redirect_to "/mechanics/#{mechanic.id}"
  end
end