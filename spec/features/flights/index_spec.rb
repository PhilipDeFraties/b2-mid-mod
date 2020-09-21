require 'rails_helper'

RSpec.describe 'Flights index page' do
  describe 'As a visitor' do
    before :each do
      @airline_1 = Airline.create!(name: 'Frontier')
      @airline_2 = Airline.create!(name: 'Southwest')

      @flight_1 = @airline_1.flights.create!(origin: 'Tampa', destination: 'Denver')
      @flight_2 = @airline_1.flights.create!(origin: 'Nashville', destination: 'Seattle')
      @flight_3 = @airline_1.flights.create!(origin: 'Atlanta', destination: 'Las Vegas')
      @flight_4 = @airline_2.flights.create!(origin: 'LA', destination: 'New York')
      @flight_5 = @airline_2.flights.create!(origin: 'Dallas', destination: 'Cincinnati')
      @flight_6 = @airline_2.flights.create!(origin: 'SanFrancisco', destination: 'Portland')

      @passenger_1 = Passenger.create(name: 'Phil')
      @passenger_2 = Passenger.create(name: 'Jade')
      @passenger_3 = Passenger.create(name: 'Robert')
      @passenger_4 = Passenger.create(name: 'Billy')
      @passenger_5 = Passenger.create(name: 'Hannah')
      @passenger_6 = Passenger.create(name: 'Sean')

      flight_passenger_1 = FlightPassengers.create(flight: @flight_1, passenger: @passenger_1)
      flight_passenger_1 = FlightPassengers.create(flight: @flight_1, passenger: @passenger_2)
      flight_passenger_1 = FlightPassengers.create(flight: @flight_2, passenger: @passenger_3)
      flight_passenger_1 = FlightPassengers.create(flight: @flight_2, passenger: @passenger_4)
      flight_passenger_1 = FlightPassengers.create(flight: @flight_3, passenger: @passenger_5)
      flight_passenger_1 = FlightPassengers.create(flight: @flight_3, passenger: @passenger_6)
      flight_passenger_1 = FlightPassengers.create(flight: @flight_4, passenger: @passenger_1)
      flight_passenger_1 = FlightPassengers.create(flight: @flight_4, passenger: @passenger_2)
      flight_passenger_1 = FlightPassengers.create(flight: @flight_5, passenger: @passenger_3)
      flight_passenger_1 = FlightPassengers.create(flight: @flight_5, passenger: @passenger_4)
      flight_passenger_1 = FlightPassengers.create(flight: @flight_6, passenger: @passenger_5)
      flight_passenger_1 = FlightPassengers.create(flight: @flight_6, passenger: @passenger_6)

    end
  end
end
