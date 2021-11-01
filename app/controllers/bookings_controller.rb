class BookingsController < ApplicationController
  def new
    flight = Flight.find(params[:flight_id])
    @booking = flight.bookings.new(date: params[:date].to_datetime)
    params[:number_of_passengers].to_i.times { @booking.passengers.build }
  end

  def create
    @booking = Booking.new(booking_params)

    if @booking.save
      redirect_to booking_path(@booking), flash: { notice: (t '.success') }
    else
      booking_errors = @booking.errors.full_messages.uniq.join(' ').html_safe
      flash[:alert] = t('.error') + ' ' + booking_errors
      render :new
    end
  end

  def show
    @booking = Booking.find(params[:id])
    return if @booking

    redirect_to root_url, flash: { alert: (t '.errors.booking_not_found') }
  end

  def search
    @booking = Booking.find_by_identifier(params[:identifier])

    if @booking
      render :show
    else
      flash[:alert] = t '.errors.booking_not_found'
      redirect_to root_path
    end
  end

  private

  def booking_params
    params.require(:booking)
          .permit(:date, :flight_id, passengers_attributes: [:name, :surname, :passport, :email])
  end
end
