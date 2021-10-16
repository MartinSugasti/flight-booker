class Flight < ActiveRecord::Base
  belongs_to :origin, class_name: 'Airport'
  belongs_to :destination, class_name: 'Airport'
  has_many :bookings

  validates_presence_of :code, :price, :departure_time, :number_of_seats, :duration
  validates :price, numericality: { greater_than: 0 }
  validates :number_of_seats, numericality: { greater_than: 0 }

  def self.find_by_search_params(origin_id:, destination_id:, date:, number_of_passengers:)
    Flight.where(origin_id: origin_id, destination_id: destination_id)
          .where('? = ANY (days_of_the_week)', date.wday)
          .select { |flight| flight.available_seats >= number_of_passengers }
  end

  def available_seats
    number_of_seats - bookings.count
  end
end
