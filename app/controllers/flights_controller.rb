class FlightsController < ApplicationController

  def index
    @flights = Flight.all
  end

  def remove_passenger
    flight = Flight.find(params[:flight_id])
    passenger = Passenger.find(params[:passenger_id])
    flight.remove_passenger(flight.id, passenger.id)
    redirect_to '/flights'
  end

end
