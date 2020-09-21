require 'rails_helper'

RSpec.describe Flight, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
  end

  describe "relationships" do
    it {should have_many (:flights).through(:flight_passengers)}
  end
