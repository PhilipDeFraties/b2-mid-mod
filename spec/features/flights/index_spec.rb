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

      @flight_passenger_1 = @flight_1.flight_passengers.create(passenger: @passenger_1)
      @flight_passenger_1 = @flight_1.flight_passengers.create(passenger: @passenger_2)
      @flight_passenger_1 = @flight_2.flight_passengers.create(passenger: @passenger_3)
      @flight_passenger_1 = @flight_2.flight_passengers.create(passenger: @passenger_4)
      @flight_passenger_1 = @flight_3.flight_passengers.create(passenger: @passenger_5)
      @flight_passenger_1 = @flight_3.flight_passengers.create(passenger: @passenger_6)
      @flight_passenger_1 = @flight_4.flight_passengers.create(passenger: @passenger_1)
      @flight_passenger_1 = @flight_4.flight_passengers.create(passenger: @passenger_2)
      @flight_passenger_1 = @flight_5.flight_passengers.create(passenger: @passenger_3)
      @flight_passenger_1 = @flight_5.flight_passengers.create(passenger: @passenger_4)
      @flight_passenger_1 = @flight_6.flight_passengers.create(passenger: @passenger_5)
      @flight_passenger_1 = @flight_6.flight_passengers.create(passenger: @passenger_6)
    end

    describe "When I visit the flights index page" do
      it "I see a list of all flight numbers" do
        visit '/flights'

        Flight.all.each do |flight|
          expect(page).to have_content(flight.id)
        end
      end

      it "And under each flight number I see the names of all that flights passengers " do
        visit '/flights'

        Flight.all.each do |flight|
          within "#flight-#{flight.id}" do
            flight.passengers.each do |passenger|
              expect(page).to have_content(passenger.name)
            end
          end
        end
      end

      describe "Next to each passengers name" do
        it "I see a link to remove that passenger from that flight" do
          visit '/flights'

          Flight.all.each do |flight|
            within "#flight-#{flight.id}" do
              flight.passengers.each do |passenger|
                expect(page).to have_link('Remove From Flight')
              end
            end
          end
        end

        describe "When a click a link to remove a passenger" do
          describe "I am returned to the flights index page" do
            it "And I no longer see that passenger listed under that flight" do
              visit '/flights'

              within "#flight-#{@flight_1.id}" do
                first(:link, 'Remove From Flight').click
              end

              expect(current_path).to eq('/flights')

              save_and_open_page
              within "#flight-#{@flight_1.id}" do
                expect(page).not_to have_content("#{@passenger_1.name}")
              end
            end
          end
        end
      end
    end
  end
end
