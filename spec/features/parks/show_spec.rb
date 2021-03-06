require 'rails_helper'

RSpec.describe "As a visitor,", type: :feature do 
  describe "when I visit an amusement park’s show page" do 
    it "then see the name and price of admissions for that amusement park." do 
      park_1 = Park.create!(name: "King's Island", price: "$15.00")

      visit "/parks/#{park_1.id}"

      within ".park-info" do 
        expect(page).to have_content(park_1.name)
        expect(page).to have_content(park_1.price)
      end
    end 

    it "then see the names of all the rides that are at that theme park listed in alphabetical order." do
      park_1 = Park.create!(name: "King's Island", price: "$15.00")

      ride_1 = Ride.create!(name: "Thunderbolt", rating: 8, park: park_1)
      ride_2 = Ride.create!(name: "Hello Kitty Island Adventure", rating: 10, park: park_1)
      ride_3 = Ride.create!(name: "The C-", rating: 7, park: park_1)

      visit "/parks/#{park_1.id}"
      
      expect(page.all('.ride-info')[0]).to have_content(ride_2.name)
      expect(page.all('.ride-info')[1]).to have_content(ride_3.name)
      expect(page.all('.ride-info')[2]).to have_content(ride_1.name)
    end

    it "then I see the average thrill rating of this amusement park’s rides" do 
      park_1 = Park.create!(name: "King's Island", price: "$15.00")

      ride_1 = Ride.create!(name: "Thunderbolt", rating: 8, park: park_1)
      ride_2 = Ride.create!(name: "Hello Kitty Island Adventure", rating: 10, park: park_1)
      ride_3 = Ride.create!(name: "The C-", rating: 7, park: park_1)

      visit "/parks/#{park_1.id}"
      expect(page).to have_content(8.3)
    end
  end
end