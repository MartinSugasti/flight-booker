class CreateFlights < ActiveRecord::Migration[6.0]
  def change
    create_table :flights do |t|
      t.string :code, null: false, index: { unique: true }
      t.integer :price, null: false
      t.time :departure_time, null: false
      t.integer :days_of_the_week, array:true, default: []
      t.integer :number_of_seats, null: false
      t.integer :duration, null: false
      t.belongs_to :origin, index: true, foreign_key: { to_table: :airports }
      t.belongs_to :destination, index: true, foreign_key: { to_table: :airports }

      t.timestamps
    end
  end
end
