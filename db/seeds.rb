# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
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
