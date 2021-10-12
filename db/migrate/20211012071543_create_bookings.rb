class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.integer :identifier
      t.belongs_to :seat, foreign_key: true
      t.belongs_to :passenger, foreign_key: true
    end
  end
end
