class BookingsController < ApplicationController
  def new
    flight = Flight.find(params[:flight_id])
    @booking = flight.bookings.new(date: params[:date].to_datetime)
    params[:number_of_passengers].to_i.times { @booking.passengers.build }
  end

  def create
    @booking = Booking.new(booking_params)

    if @booking.save
      flash[:notice] = 'Bookings confirmed'
      redirect_to booking_path(@booking)
    else
      flash[:alert] = 'Something went wrong'
      render :new
    end
  end

  def show
    @booking = Booking.find(params[:id])
    return if @booking

    flash[:alert] = 'Sorry, this booking does not exist'
    redirect_to root_url
  end

  private

  def booking_params
    params.require(:booking)
          .permit(:date, :flight_id, passengers_attributes: [:name, :surname, :passport, :email])
  end
end
