require 'rails_helper'

describe "As a user," do
  describe "When I go to a mechanics show page" do
    it "I see their name, years of experience, and names of all rides they’re working on and I also see a form to add a ride to their workload" do
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

      visit "/mechanics/#{mechanic.id}"

      expect(page).to have_content(mechanic.name)
      expect(page).to have_content(mechanic.years_experience)

      within '#current-rides' do
        expect(page).to have_content(ride_1.name)
        expect(page).to have_content(ride_2.name)
        expect(page).to have_content(ride_3.name)
      end

      within '#add-rides' do
        expect(page).to have_field("Name")
        expect(page).to have_button("Submit")
      end
    end
    describe "When I fill in that field with an id of a ride that exists in the database and I click submit" do
      it "I’m taken back to that mechanics show page and I see the name of that newly added ride on this mechanics show page" do
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
        ride_4 = Ride.create!(
          name: "Twister",
          thrill_rating: 4,
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

        visit "/mechanics/#{mechanic.id}"

        within '#add-rides' do
          fill_in "Name", with: "Twister"
          click_button "Submit"
        end

        expect(current_path).to eq("/mechanics/#{mechanic.id}")

        within '#current-rides' do
          expect(page).to have_content(ride_4.name)
        end
      end
    end
  end
end

describe "As a user," do
  describe "When I visit a mechanic's show page" do
    it "Then I see all their rides listed in alphabetical order" do
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

      visit "/mechanics/#{mechanic.id}"

      within '#current-rides' do
        expect(page.all('p')[0]).to have_content(ride_2.name)
        expect(page.all('p')[1]).to have_content(ride_3.name)
        expect(page.all('p')[2]).to have_content(ride_1.name)
      end
    end
  end
end
