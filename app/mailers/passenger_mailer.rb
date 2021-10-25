class PassengerMailer < ApplicationMailer
  default from: 'notifications@flightbookerbymartinsugasti.com'

  def booking_confirmation_email
    @passenger = params[:passenger]
    @booking = params[:booking]
    @url = booking_url(@booking)
    attachments['robots.txt'] = File.read(Rails.root.join('public/robots.txt'))
    mail(to: @passenger.email, subject: 'Booking confirmation')
  end
end
