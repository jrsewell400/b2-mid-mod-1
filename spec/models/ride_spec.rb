require 'rails_helper'

RSpec.describe Ride, type: :model do 
  describe "validations" do 
    it {should validate_presence_of :name}
    it {should validate_presence_of :rating}
  end 

  describe "relationships" do 
    it {should belong_to :park}
  end
end