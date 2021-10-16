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
    @flights = Flight.find_by_search_params(
      origin_id: params[:origin_id],
      destination_id: params[:destination_id],
      date: params[:date].to_datetime,
      number_of_passengers: params[:number_of_passengers].to_i
    )
    return if @flights.present?

    flash.now[:alert] = 'There is no flights for the specified parameters'
  end
end
