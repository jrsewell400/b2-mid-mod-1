class Park < ApplicationRecord 
  validates_presence_of :name, :price
  has_many :rides

  def list_rides 
    rides.select(:name).order(:name)
  end
end