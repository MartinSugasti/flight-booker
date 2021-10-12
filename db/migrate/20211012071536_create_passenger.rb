class CreatePassenger < ActiveRecord::Migration[6.0]
  def change
    create_table :passengers do |t|
      t.string :name
      t.string :surname
      t.string :passport
      t.string :email

      t.timestamps
    end
  end
end
