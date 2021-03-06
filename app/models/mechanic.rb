class Mechanic < ApplicationRecord
  has_many :work_orders
  has_many :rides, through: :work_orders

  validates_presence_of :name, :years_experience

  def sorted_rides
    rides.order(:name)
  end
end
