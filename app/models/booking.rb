class Booking < ActiveRecord::Base
  before_save :generate_identifier

  belongs_to :flight
  has_many :passengers

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

    self.identifier = ('A'..'Z').to_a.sample(3).join + ('0'..'9').to_a.sample(3).join
  end
end
