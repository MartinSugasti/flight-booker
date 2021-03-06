class CreateCities < ActiveRecord::Migration[6.0]
  def change
    create_table :cities do |t|
      t.string :name, null: false, index: { unique: true }
      t.string :code, null: false, limit: 3, index: { unique: true }

      t.timestamps
    end
  end
end
