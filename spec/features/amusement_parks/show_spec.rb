require 'rails_helper'

describe "As a visitor," do
  describe "When I visit an amusement park’s show page" do
    it "I see the name/price of admissions for that amusement park, the names of all the rides at the park, and the average thrill rating of those rides" do
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

      visit "/parks/#{park.id}"

      expect(page).to have_content(park.name)
      expect(page).to have_content("Average Thrill Rating of Rides: #{park.average_thrill_rating.round(1)}")

      within "#ride-#{ride_1.id}" do
        expect(page).to have_content(ride_1.name)
        expect(page).to have_content("Thrill Rating: #{ride_1.thrill_rating}")
      end

      within "#ride-#{ride_2.id}" do
        expect(page).to have_content(ride_2.name)
        expect(page).to have_content("Thrill Rating: #{ride_2.thrill_rating}")
      end

      within "#ride-#{ride_3.id}" do
        expect(page).to have_content(ride_3.name)
        expect(page).to have_content("Thrill Rating: #{ride_3.thrill_rating}")
      end
    end
  end
end
# Ex: Hershey Park
#    Admissions: $50.00
#
#    Rides:
#           1. Lightning Racer
#           2. Storm Runner
#           3. The Great Bear
#    Average Thrill Rating of Rides: 7.8/10
