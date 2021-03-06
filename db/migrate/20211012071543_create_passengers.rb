class CreatePassengers < ActiveRecord::Migration[6.0]
  def change
    create_table :passengers do |t|
      t.string :name, null: false
      t.string :surname, null: false
      t.string :passport, null: false
      t.string :email, null: false
      t.belongs_to :booking, foreign_key: true

      t.timestamps
    end
  end
end
