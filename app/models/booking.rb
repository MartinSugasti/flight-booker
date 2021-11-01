class Booking < ActiveRecord::Base
  before_save :generate_identifier
  after_save :send_confirmation_email

  belongs_to :flight
  has_many :passengers, index_errors: true

  accepts_nested_attributes_for :passengers

  validates_presence_of :date
  validate :check_available_seats

  private

  def check_available_seats
    return if flight.available_seats(date) >= passengers.count

    errors.add(:base, 'There is no enough space on the plane')
  end

  def generate_identifier
    return if identifier.present?

    self.identifier = SecureRandom.hex 3
  end

  def send_confirmation_email
    passengers.each do |passenger|
      PassengerMailer.with(booking: self, passenger: passenger)
                     .booking_confirmation_email.deliver_now
    end
  end
end
