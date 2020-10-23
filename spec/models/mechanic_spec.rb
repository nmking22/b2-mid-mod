require 'rails_helper'

describe Mechanic, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :years_experience}
  end

  describe "relationships" do
    it {should have_many :work_orders}
    it {should have_many(:rides).through(:work_orders)}
  end

  describe "instance methods" do
    it '#sorted_rides' do
      mechanic = Mechanic.create!(
        name: "Daryl",
        years_experience: 5
      )
      park = AmusementPark.create!(
        name: "Elitch Gardens",
        admission_price: 30.00
      )
      ride_1 = Ride.create!(
        name: "Tower of Doom",
        thrill_rating: 9,
        amusement_park: park
      )
      ride_2 = Ride.create!(
        name: "Boomerang",
        thrill_rating: 7,
        amusement_park: park
      )
      ride_3 = Ride.create!(
        name: "Mind Eraser",
        thrill_rating: 6,
        amusement_park: park
      )
      WorkOrder.create!(
        mechanic: mechanic,
        ride: ride_1
      )
      WorkOrder.create!(
        mechanic: mechanic,
        ride: ride_2
      )
      WorkOrder.create!(
        mechanic: mechanic,
        ride: ride_3
      )

      expect(mechanic.sorted_rides[0]).to eq(ride_2)
      expect(mechanic.sorted_rides[1]).to eq(ride_3)
      expect(mechanic.sorted_rides[2]).to eq(ride_1)
    end
  end
end
