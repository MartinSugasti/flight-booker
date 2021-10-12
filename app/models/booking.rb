class Booking < ActiveRecord::Base
  belongs_to :seat
  belongs_to :passenger

  validates_presence_of :identifier
end
