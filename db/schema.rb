# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_10_12_071543) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "airports", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "city_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["city_id"], name: "index_airports_on_city_id"
    t.index ["name"], name: "index_airports_on_name", unique: true
  end

  create_table "bookings", force: :cascade do |t|
    t.string "identifier", null: false
    t.datetime "date", null: false
    t.bigint "flight_id"
    t.index ["flight_id"], name: "index_bookings_on_flight_id"
    t.index ["identifier"], name: "index_bookings_on_identifier", unique: true
  end

  create_table "cities", force: :cascade do |t|
    t.string "name", null: false
    t.string "code", limit: 3, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["code"], name: "index_cities_on_code", unique: true
    t.index ["name"], name: "index_cities_on_name", unique: true
  end

  create_table "flights", force: :cascade do |t|
    t.string "code", null: false
    t.integer "price", null: false
    t.time "departure_time", null: false
    t.integer "days_of_the_week", default: [], array: true
    t.integer "number_of_seats", null: false
    t.integer "duration", null: false
    t.bigint "origin_id"
    t.bigint "destination_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["code"], name: "index_flights_on_code", unique: true
    t.index ["destination_id"], name: "index_flights_on_destination_id"
    t.index ["origin_id"], name: "index_flights_on_origin_id"
  end

  create_table "passengers", force: :cascade do |t|
    t.string "name", null: false
    t.string "surname", null: false
    t.string "passport", null: false
    t.string "email", null: false
    t.bigint "booking_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["booking_id"], name: "index_passengers_on_booking_id"
  end

  add_foreign_key "airports", "cities"
  add_foreign_key "bookings", "flights"
  add_foreign_key "flights", "airports", column: "destination_id"
  add_foreign_key "flights", "airports", column: "origin_id"
  add_foreign_key "passengers", "bookings"
end
