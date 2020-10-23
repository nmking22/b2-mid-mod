class WorkOrder < ApplicationRecord
  belongs_to :amusement_park
  belongs_to :mechanic
end
