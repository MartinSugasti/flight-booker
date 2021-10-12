class CreateAirports < ActiveRecord::Migration[6.0]
  def change
    create_table :airports do |t|
      t.string :name, null: false, index: { unique: true }
      t.belongs_to :city, foreign_key: true

      t.timestamps
    end
  end
end
