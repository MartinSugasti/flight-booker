class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.integer :identifier, null: false, index: { unique: true }
      t.belongs_to :flight, foreign_key: true
    end
  end
end
