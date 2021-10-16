class Passenger < ActiveRecord::Base
  belongs_to :booking

  validates_presence_of :name, :surname, :passport, :email
end
