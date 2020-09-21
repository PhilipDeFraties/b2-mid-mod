class Flight < ApplicationRecord
  belongs_to :airline
  has_many :flight_passengers
  has_many :passengers, through: :flight_passengers

  def remove_passenger(flight_id, passenger_id)
    FlightPassenger.where(flight_id: flight_id.to_s, passenger_id: passenger_id.to_s).delete_all
  end
end
