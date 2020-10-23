require 'rails_helper'

describe Mechanic, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :years_experience}
  end

  describe "relationships" do
    it {should have_many :work_orders}
    it {should have_many(:rides), through(:work_orders)}
  end
end
