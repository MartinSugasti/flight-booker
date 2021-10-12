class Seat < ActiveRecord::Base
  belongs_to :flight
  has_one :booking

  validates_presence_of :number
  validate :number_range

  def number_range
    error.add(:number, ' is out of range') if number <= 0 || number > flight.number_of_seats
  end
end
