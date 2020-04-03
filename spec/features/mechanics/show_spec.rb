require 'rails_helper'

RSpec.describe "As a user,", type: :feature do 
  describe "when I go to a mechanics show page" do 
    it "then I see their name, years of experience, and names of all rides they’re working on." do 
      park_1 = Park.create!(name: "King's Island", price: "$15.00")

      ride_1 = Ride.create!(name: "Thunderbolt", rating: 8, park: park_1)
      ride_2 = Ride.create!(name: "Hello Kitty Island Adventure", rating: 10, park: park_1)
      ride_3 = Ride.create!(name: "The C-", rating: 7, park: park_1)

      mechanic_1 = Mechanic.create!(name: "Jordan Sewell", experience: "1000")

      MechanicRide.create!(mechanic: mechanic_1, ride: ride_1)
      MechanicRide.create!(mechanic: mechanic_1, ride: ride_3)

      visit "/mechanics/#{mechanic_1.id}"

      within ".mechanic-info" do 
        expect(page).to have_content(mechanic_1.name)
        expect(page).to have_content(mechanic_1.experience)
      end

      within ".mechanic-rides" do 
        expect(page).to have_content(ride_1.name)
        expect(page).to have_content(ride_3.name)
      end
    end

    it "then I also see a form to add a ride to their workload, fill in that field and hit submit, redirect to Mechanics Show, and see the newly added ride." do 
      park_1 = Park.create!(name: "King's Island", price: "$15.00")

      ride_1 = Ride.create!(name: "Thunderbolt", rating: 8, park: park_1)
      ride_2 = Ride.create!(name: "Hello Kitty Island Adventure", rating: 10, park: park_1)
      ride_3 = Ride.create!(name: "The C-", rating: 7, park: park_1)

      mechanic_1 = Mechanic.create!(name: "Jordan Sewell", experience: "1000")

      MechanicRide.create!(mechanic: mechanic_1, ride: ride_1)
      MechanicRide.create!(mechanic: mechanic_1, ride: ride_3)

      visit "/mechanics/#{mechanic_1.id}"
      
      within ".mechanic-rides" do 
        expect(page).to have_content(ride_1.name)
        expect(page).to have_content(ride_3.name)
      end

      fill_in :ride, with: "278"
      click_on "Submit"

      within ".mechanic-rides" do 
        expect(page).to have_content(ride_1.name)
        expect(page).to have_content(ride_2.name)
        expect(page).to have_content(ride_3.name)
      end
    end
  end 
end 

# As a user, 
# When I go to a mechanics show page 
# I see their name, years of experience, and names of all rides they’re working on
# And I also see a form to add a ride to their workload
# When I fill in that field with an id of an existing ride and hit submit
# I’m taken back to that mechanics show page
# And I see the name of that newly added ride on this mechanics show page
 
# Ex: 
 
# Mechanic: Kara Smith
# Years of Experience: 11
 
# Current rides they’re working on: 
# The Frog Hopper 
# Fahrenheit 
# The Kiss Raise
 
# Add a ride to workload: 
#  _pretent_this_is_a_textfield_