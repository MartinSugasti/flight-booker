class City < ActiveRecord::Base
  has_many :airports, dependent: :destroy

  validates_presence_of :name, :code
  validates_uniqueness_of :name, :code
  validates :code, length: { is: 3 },
                   format: { with: /\A[a-zA-Z]+\z/, message: ' only allows letters' }
end
