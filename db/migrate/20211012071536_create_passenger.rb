class CreatePassenger < ActiveRecord::Migration[6.0]
  def change
    create_table :passengers do |t|
      t.string :name, null: false
      t.string :surname, null: false
      t.string :passport, null: false, index: { unique: true }
      t.string :email, null: false, index: { unique: true }

      t.timestamps
    end
  end
end
