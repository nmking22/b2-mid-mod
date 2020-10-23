require 'rails_helper'

describe "As a user," do
  describe "When I visit a mechanics index page" do
    it "I see a header saying 'All Mechanics' and I see a list of all mechanic’s names and their years of experience" do
      mechanic_1 = Mechanic.create!(
        name: "Daryl",
        years_experience: 5
      )
      mechanic_2 = Mechanic.create!(
        name: "Cheryl",
        years_experience: 11
      )
      mechanic_3 = Mechanic.create!(
        name: "Pharell",
        years_experience: 2
      )

      visit '/mechanics'

      expect(page).to have_content("All Mechanics")

      within "#mechanic-#{mechanic_1.id}" do
        expect(page).to have_content("#{mechanic_1.name} - #{mechanic_1.years_experience} years of experience")
      end

      within "#mechanic-#{mechanic_2.id}" do
        expect(page).to have_content("#{mechanic_2.name} - #{mechanic_2.years_experience} years of experience")
      end

      within "#mechanic-#{mechanic_3.id}" do
        expect(page).to have_content("#{mechanic_3.name} - #{mechanic_3.years_experience} years of experience")
      end
    end
  end
end
