class Booking < ActiveRecord::Base
  belongs_to :flight
  has_many :passengers

  validates_presence_of :identifier
  validate :check_available_seats

  private

  def check_available_seats
    return if flight.available_seats >= passengers.count

    errors.add(:base, 'There is no enough space on the plane')
  end
end
