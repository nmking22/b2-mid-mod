class WorkOrdersController < ApplicationController
  def new
    ride = Ride.where(name: params[:name])[0]
    WorkOrder.create!(
      mechanic_id: params[:id],
      ride: ride
    )

    redirect_to "/mechanics/#{params[:id]}"
  end
end
