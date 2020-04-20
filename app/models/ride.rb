class Ride < ApplicationRecord
  validates_presence_of :name, :rating
  belongs_to :park
  has_many :mechanic_rides 
  has_many :mechanics, through: :mechanic_rides

  def same_rating 
    park.rides.select(:name).where('rating = ? AND id != ?', self.rating, self.id)
  end
end