require 'rails_helper'

RSpec.describe Park, type: :model do 
  describe "validations" do 
    it {should validate_presence_of :name}
    it {should validate_presence_of :price}
  end 

  describe "relationships" do 
    it {should have_many :rides}
  end

  describe "instance methods" do 
    it ".list_rides" do 
      park_1 = Park.create!(name: "King's Island", price: "$15.00")

      ride_1 = Ride.create!(name: "Thunderbolt", rating: 8, park: park_1)
      ride_2 = Ride.create!(name: "Hello Kitty Island Adventure", rating: 10, park: park_1)
      ride_3 = Ride.create!(name: "The C-", rating: 7, park: park_1)
      
      expect(park_1.list_rides).to eq([ride_2, ride_3, ride_1])
    end

    it ".avg_rating" do 
      park_1 = Park.create!(name: "King's Island", price: "$15.00")

      ride_1 = Ride.create!(name: "Thunderbolt", rating: 7, park: park_1)
      ride_2 = Ride.create!(name: "Hello Kitty Island Adventure", rating: 10, park: park_1)
      ride_3 = Ride.create!(name: "The C-", rating: 7, park: park_1)
      
      expect(park_1.avg_rating).to eq(8)
    end
  end
end