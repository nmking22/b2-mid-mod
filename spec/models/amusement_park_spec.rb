require 'rails_helper'

describe AmusementPark, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :admission_price}
  end

  describe "relationships" do
    it {should have_many :rides}
  end

  describe "instance methods" do
    it "#average_thrill_rating" do
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

      expect(park.average_thrill_rating.round(1)).to eq(7.3)
    end
  end
end
