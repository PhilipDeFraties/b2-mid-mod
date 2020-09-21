require 'rails_helper'

RSpec.describe 'Airline show page' do
  describe 'As a visitor' do
    before :each do
      @airline_1 = Airline.create!(name: 'Frontier')

      @flight_1 = @airline_1.flights.create!(origin: 'Tampa', destination: 'Denver')
      @flight_2 = @airline_1.flights.create!(origin: 'Nashville', destination: 'Seattle')
      @flight_3 = @airline_1.flights.create!(origin: 'Atlanta', destination: 'Las Vegas')

      @passenger_1 = Passenger.create(name: 'Phil')
      @passenger_2 = Passenger.create(name: 'Jade')
      @passenger_3 = Passenger.create(name: 'Robert')

      @flight_passenger_1 = @flight_1.flight_passengers.create(passenger: @passenger_1)
      @flight_passenger_1 = @flight_1.flight_passengers.create(passenger: @passenger_2)
      @flight_passenger_1 = @flight_2.flight_passengers.create(passenger: @passenger_3)
      @flight_passenger_1 = @flight_2.flight_passengers.create(passenger: @passenger_1)
      @flight_passenger_1 = @flight_3.flight_passengers.create(passenger: @passenger_2)
      @flight_passenger_1 = @flight_3.flight_passengers.create(passenger: @passenger_3)
    end

    describe "When I visit an airlines show page" do
      it "I see a unique list of passengers that have flights from that airline" do
        visit "/airlines/#{@airline_1.id}"

        @airline_1.passengers.each do |passenger|
          expect(page).to have_content(passenger.name, count: 1)
        end
      end
    end
  end
end
