class Flight < ActiveRecord::Base
  belongs_to :origin, class_name: 'Airport'
  belongs_to :destination, class_name: 'Airport'
  has_many :seats, dependent: :destroy

  validates_presence_of :code, :price, :departure_time, :number_of_seats, :duration
  validates :price, numericality: { greater_than: 0 }
  validates :number_of_seats, numericality: { greater_than: 0 }
end
