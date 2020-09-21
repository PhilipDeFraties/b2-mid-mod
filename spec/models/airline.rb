require 'rails_helper'

RSpec.describe Airline, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
  end

  describe "relationships" do
    it {should have_many :flights}
  end

  describe 'instance methods' do
   describe '#uniq_passengers' do
     it 'displays a list of unique passengers that this airlines flights has' do
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

       expected = ['Phil', 'Jade', 'Robert']
       # expect(@airline_1.uniq_passengers.sort).to eq(expected.sort)
      end
     end
   end
 end
