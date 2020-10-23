class AmusementPark < ApplicationRecord
  has_many :rides

  validates_presence_of :name, :admission_price

  def average_thrill_rating
    rides.average(:thrill_rating).to_f
  end
end
