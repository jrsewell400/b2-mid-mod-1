require 'rails_helper'

RSpec.describe "As a visitor,", type: :feature do 
  describe "when I visit an amusement park’s show page" do 
    xit "then see the name and price of admissions for that amusement park." do 
      park_1 = Park.create!(name: "King's Island", price: "$15.00")

      visit "/parks/#{park_1.id}"

      within ".park-info" do 
        expect(page).to have_content(park_1.name)
        expect(page).to have_content(park_1.price)
      end
    end 

    xit "then see the names of all the rides that are at that theme park listed in alphabetical order." do
      park_1 = Park.create!(name: "King's Island", price: "$15.00")

      ride_1 = Ride.create!(name: "Thunderbolt", rating: 8, park: park_1)
      ride_2 = Ride.create!(name: "Hello Kitty Island Adventure", rating: 10, park: park_1)
      ride_3 = Ride.create!(name: "The C-", rating: 7, park: park_1)

      visit "/parks/#{park_1.id}"
      
      expect(page.all('.ride-info')[0]).to have_content(ride_2.name)
      save_and_open_page
      expect(page.all('.ride-info')[1]).to have_content(ride_3.name)
      expect(page.all('.ride-info')[2]).to have_content(ride_1.name)
    end

    xit "then I see the average thrill rating of this amusement park’s rides" do 
    end
  end
end

# Story 2
# As a visitor, 
# When I visit an amusement park’s show page
# I see the name and price of admissions for that amusement park
# And I see the names of all the rides that are at that theme park listed in alphabetical order
# And I see the average thrill rating of this amusement park’s rides
 
# Ex: Hershey Park
#     Admissions: $50.00
       
#     Rides: 
#            1. Lightning Racer 
#            2. Storm Runner
#            3. The Great Bear 
 
#     Average Thrill Rating of Rides: 7.8/10