require 'rails_helper'

RSpec.describe "As a visitor,", type: :feature do 
  describe "when I visit the Mechanics Index page" do 
    it "then I see a header saying All Mechanics and I see a list of all mechanic’s names and their years of experience." do 
      mechanic_1 = Mechanic.create!(name: "Jordan Sewell", experience: "1000")
      mechanic_2 = Mechanic.create!(name: "Luna Sewell", experience: "5")
      mechanic_3 = Mechanic.create!(name: "Nova Sewell", experience: "10")

      visit "/mechanics"

      expect(page).to have_content("All Mechanics")

      within "#mechanic-#{mechanic_1.id}" do
        expect(page).to have_content(mechanic_1.name)
        expect(page).to have_content(mechanic_1.experience)
      end

      within "#mechanic-#{mechanic_2.id}" do
        expect(page).to have_content(mechanic_2.name)
        expect(page).to have_content(mechanic_2.experience)
      end

      within "#mechanic-#{mechanic_3.id}" do
        expect(page).to have_content(mechanic_3.name)
        expect(page).to have_content(mechanic_3.experience)
      end
    end
  end
end