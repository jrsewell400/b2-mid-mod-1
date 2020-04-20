require 'rails_helper'

RSpec.describe "As a visitor,", type: :feature do 
  describe "when I go to a rides show page" do 
    it "I see that ride's name, and thrill rating." do
      park_1 = Park.create!(name: "King's Island", price: "$15.00")

      ride_1 = Ride.create!(name: "Thunderbolt", rating: 10, park: park_1)

      visit "/rides/#{ride_1.id}"

      expect(page).to have_content(ride_1.name)
      expect(page).to have_content(ride_1.rating)
    end 

    it "then I also see a section titled 'Rides with the same thrill rating', and, under that title, I see a list of rides from that same park with the same thrill rating of this ride." do 
      park_1 = Park.create!(name: "King's Island", price: "$15.00")

      ride_1 = Ride.create!(name: "Thunderbolt", rating: 10, park: park_1)
      ride_2 = Ride.create!(name: "Lightning Strike", rating: 10, park: park_1)
      ride_3 = Ride.create!(name: "Hello Kitty Island Adventure", rating: 10, park: park_1)
      ride_4 = Ride.create!(name: "The Alright", rating: 7, park: park_1)
      ride_5 = Ride.create!(name: "The C-", rating: 7, park: park_1)
      ride_6 = Ride.create!(name: "The Average Ride", rating: 7, park: park_1)

      visit "/rides/#{ride_1.id}"

      within ".same-rating" do 
        expect(page).to have_content(ride_2.name)
        expect(page).to have_content(ride_3.name)
      end

      visit "/rides/#{ride_4.id}"

      within ".same-rating" do 
        expect(page).to have_content(ride_5.name)
        expect(page).to have_content(ride_6.name)
      end
    end
  end 
end 