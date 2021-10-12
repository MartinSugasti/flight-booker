class CreateSeats < ActiveRecord::Migration[6.0]
  def change
    create_table :seats do |t|
      t.integer :number, null: false
      t.belongs_to :flight, foreign_key: true

      t.timestamps
    end
  end
end
