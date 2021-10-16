class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.string :identifier, null: false, index: { unique: true }
      t.datetime :date, null: false
      t.belongs_to :flight, foreign_key: true
    end
  end
end
