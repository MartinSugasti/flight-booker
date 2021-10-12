class Airport < ActiveRecord::Base
  belongs_to :city
  has_many :departing_flights, class_name: 'Flight', foreign_key: :origin_id, dependent: :destroy
  has_many :arriving_flights, class_name: 'Flight', foreign_key: :destination_id,
                              dependent: :destroy

  validates_presence_of :name
  validates_uniqueness_of :name
end
