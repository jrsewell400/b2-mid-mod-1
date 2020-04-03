class Park < ApplicationRecord 
  validates_presence_of :name, :price
  has_many :rides

  def list_rides 
    rides.order(name: :asc)
  end

  def avg_rating 
    if self.rides.empty?
      0
    else 
      rides.average(:rating)
    end
  end
end