class Passenger < ActiveRecord::Base
  has_many :bookings

  validates_presence_of :name, :surname, :passport, :email
end
