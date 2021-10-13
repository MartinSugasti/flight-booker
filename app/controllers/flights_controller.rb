class FlightsController < ApplicationController
  def index
    return if search_params.empty?

    find_flights
  end

  private

  def search_params
    params.permit(:origin_id, :destination_id, :date)
  end

  def find_flights
    @flights = Flight.where(
      origin_id: params[:origin_id],
      destination_id: params[:destination_id]
    ).where('? = ANY (days_of_the_week)', params[:date].to_datetime.wday)

    return if @flights.present?

    flash.now[:alert] = 'There is no flights for the specified parameters'
  end
end
