# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

cities = [
  {
    name: 'San Francisco',
    code: 'SFO'
  },
  {
    name: 'New York',
    code: 'NYC'
  },
  {
    name: 'Los Angeles',
    code: 'LAX'
  },
  {
    name: 'Chicago',
    code: 'CHI'
  },
  {
    name: 'Atlanta',
    code: 'ATL'
  },
  {
    name: 'Miami',
    code: 'MIA'
  }
]

cities.each { |city| City.create(city) }

airports = [
  {
    name: 'San Francisco International Airport',
    city_code: 'SFO'
  },
  {
    name: 'San Francisco Local Airport',
    city_code: 'SFO'
  },
  {
    name: 'Los Angeles International Airport',
    city_code: 'LAX'
  },
  {
    name: "O'Hare",
    city_code: 'CHI'
  },
  {
    name: 'Midway',
    city_code: 'CHI'
  },
  {
    name: 'Hartsfield-Jackson',
    city_code: 'ATL'
  },
  {
    name: 'Atlanta Local Airport',
    city_code: 'ATL'
  },
  {
    name: 'Miami International Airport',
    city_code: 'MIA'
  },
  {
    name: 'John F. Kennedy',
    city_code: 'NYC'
  }
]

airports.each do |airport|
  city = City.find_by_code(airport[:city_code])
  city.airports.create(name: airport[:name])
end

flights = [
  {
    code: 'AA989',
    price: 200,
    departure_time: '10',
    days_of_the_week: [0, 2, 3, 5, 6],
    number_of_seats: 250,
    duration: 300,
    origin_name: 'San Francisco International Airport',
    destination_name: 'John F. Kennedy'
  },
  {
    code: 'AA242',
    price: 300,
    departure_time: '9',
    days_of_the_week: [1, 3, 4, 5],
    number_of_seats: 150,
    duration: 300,
    origin_name: 'San Francisco International Airport',
    destination_name: "O'Hare"
  },
  {
    code: 'DL454',
    price: 300,
    departure_time: '13',
    days_of_the_week: [0, 1, 2, 6],
    number_of_seats: 200,
    duration: 240,
    origin_name: 'San Francisco Local Airport',
    destination_name: 'Hartsfield-Jackson'
  },
  {
    code: 'DL880',
    price: 400,
    departure_time: '14',
    days_of_the_week: [0, 4, 5, 6],
    number_of_seats: 400,
    duration: 360,
    origin_name: 'Los Angeles International Airport',
    destination_name: 'John F. Kennedy'
  },
  {
    code: 'DL320',
    price: 200,
    departure_time: '10',
    days_of_the_week: [0, 1, 2, 4, 5, 6],
    number_of_seats: 300,
    duration: 60,
    origin_name: 'Los Angeles International Airport',
    destination_name: 'San Francisco Local Airport'
  },
  {
    code: 'DL018',
    price: 300,
    departure_time: '11',
    days_of_the_week: [0, 1, 2, 3, 4, 5, 6],
    number_of_seats: 400,
    duration: 300,
    origin_name: 'Los Angeles International Airport',
    destination_name: 'Midway'
  },
  {
    code: 'UN323',
    price: 400,
    departure_time: '6',
    days_of_the_week: [0, 1, 2, 3, 4, 5, 6],
    number_of_seats: 150,
    duration: 300,
    origin_name: "O'Hare",
    destination_name: 'San Francisco International Airport'
  },
  {
    code: 'UN545',
    price: 400,
    departure_time: '13',
    days_of_the_week: [1, 2, 3, 4, 6],
    number_of_seats: 100,
    duration: 240,
    origin_name: "O'Hare",
    destination_name: 'Atlanta Local Airport'
  },
  {
    code: 'UN111',
    price: 200,
    departure_time: '18',
    days_of_the_week: [1, 2, 3, 4, 5],
    number_of_seats: 200,
    duration: 300,
    origin_name: 'Midway',
    destination_name: 'Miami International Airport'
  },
  {
    code: 'SW290',
    price: 300,
    departure_time: '20',
    days_of_the_week: [1, 2, 3, 4, 5],
    number_of_seats: 250,
    duration: 180,
    origin_name: 'Midway',
    destination_name: 'Hartsfield-Jackson'
  },
  {
    code: 'SW409',
    price: 300,
    departure_time: '19',
    days_of_the_week: [0, 1, 2, 5, 6],
    number_of_seats: 300,
    duration: 240,
    origin_name: 'Hartsfield-Jackson',
    destination_name: 'San Francisco International Airport'
  },
  {
    code: 'SW349',
    price: 500,
    departure_time: '5',
    days_of_the_week: [0, 1, 2, 5, 6],
    number_of_seats: 200,
    duration: 180,
    origin_name: 'Hartsfield-Jackson',
    destination_name: 'Los Angeles International Airport'
  },
  {
    code: 'DL676',
    price: 300,
    departure_time: '21',
    days_of_the_week: [0, 1, 2, 5, 6],
    number_of_seats: 200,
    duration: 360,
    origin_name: 'Atlanta Local Airport',
    destination_name: 'John F. Kennedy'
  },
  {
    code: 'DL790',
    price: 300,
    departure_time: '20',
    days_of_the_week: [0, 1, 2, 5, 6],
    number_of_seats: 150,
    duration: 300,
    origin_name: 'Miami International Airport',
    destination_name: 'Midway'
  },
  {
    code: 'JB423',
    price: 300,
    departure_time: '7',
    days_of_the_week: [3, 4, 5, 6],
    number_of_seats: 100,
    duration: 240,
    origin_name: 'Miami International Airport',
    destination_name: 'John F. Kennedy'
  },
  {
    code: 'JB222',
    price: 300,
    departure_time: '7',
    days_of_the_week: [0, 1, 3, 4, 5, 6],
    number_of_seats: 100,
    duration: 180,
    origin_name: 'John F. Kennedy',
    destination_name: 'Miami International Airport'
  },
  {
    code: 'JT990',
    price: 600,
    departure_time: '9',
    days_of_the_week: [6],
    number_of_seats: 50,
    duration: 90,
    origin_name: 'John F. Kennedy',
    destination_name: 'Los Angeles International Airport'
  },
  {
    code: 'AA979',
    price: 200,
    departure_time: '10',
    days_of_the_week: [0, 2, 3, 5, 6],
    number_of_seats: 250,
    duration: 300,
    origin_name: 'John F. Kennedy',
    destination_name: 'San Francisco International Airport'
  },
  {
    code: 'AA252',
    price: 300,
    departure_time: '9',
    days_of_the_week: [1, 3, 4, 5],
    number_of_seats: 150,
    duration: 300,
    origin_name: "O'Hare",
    destination_name: 'San Francisco International Airport'
  },
  {
    code: 'DL464',
    price: 300,
    departure_time: '13',
    days_of_the_week: [0, 1, 2, 6],
    number_of_seats: 200,
    duration: 240,
    origin_name: 'Hartsfield-Jackson',
    destination_name: 'San Francisco Local Airport'
  },
  {
    code: 'DL870',
    price: 400,
    departure_time: '14',
    days_of_the_week: [0, 4, 5, 6],
    number_of_seats: 400,
    duration: 360,
    origin_name: 'John F. Kennedy',
    destination_name: 'Los Angeles International Airport'
  },
  {
    code: 'DL310',
    price: 200,
    departure_time: '10',
    days_of_the_week: [0, 1, 2, 4, 5, 6],
    number_of_seats: 300,
    duration: 60,
    origin_name: 'San Francisco Local Airport',
    destination_name: 'Los Angeles International Airport'
  },
  {
    code: 'DL028',
    price: 300,
    departure_time: '11',
    days_of_the_week: [0, 1, 2, 3, 4, 5, 6],
    number_of_seats: 400,
    duration: 300,
    origin_name: 'Midway',
    destination_name: 'Los Angeles International Airport'
  },
  {
    code: 'UN313',
    price: 400,
    departure_time: '6',
    days_of_the_week: [0, 1, 2, 3, 4, 5, 6],
    number_of_seats: 150,
    duration: 300,
    origin_name: 'San Francisco International Airport',
    destination_name: "O'Hare"
  },
  {
    code: 'UN575',
    price: 400,
    departure_time: '13',
    days_of_the_week: [1, 2, 3, 4, 6],
    number_of_seats: 100,
    duration: 240,
    origin_name: 'Atlanta Local Airport',
    destination_name: "O'Hare"
  },
  {
    code: 'UN181',
    price: 200,
    departure_time: '18',
    days_of_the_week: [1, 2, 3, 4, 5],
    number_of_seats: 200,
    duration: 300,
    origin_name: 'Miami International Airport',
    destination_name: 'Midway'
  },
  {
    code: 'SW200',
    price: 300,
    departure_time: '20',
    days_of_the_week: [1, 2, 3, 4, 5],
    number_of_seats: 250,
    duration: 180,
    origin_name: 'Hartsfield-Jackson',
    destination_name: 'Midway'
  },
  {
    code: 'SW419',
    price: 300,
    departure_time: '19',
    days_of_the_week: [0, 1, 2, 5, 6],
    number_of_seats: 300,
    duration: 240,
    origin_name: 'San Francisco International Airport',
    destination_name: 'Hartsfield-Jackson'
  },
  {
    code: 'SW329',
    price: 500,
    departure_time: '5',
    days_of_the_week: [0, 1, 2, 5, 6],
    number_of_seats: 200,
    duration: 180,
    origin_name: 'Los Angeles International Airport',
    destination_name: 'Hartsfield-Jackson'
  },
  {
    code: 'DL626',
    price: 300,
    departure_time: '21',
    days_of_the_week: [0, 1, 2, 5, 6],
    number_of_seats: 200,
    duration: 360,
    origin_name: 'John F. Kennedy',
    destination_name: 'Atlanta Local Airport'
  },
  {
    code: 'DL720',
    price: 300,
    departure_time: '20',
    days_of_the_week: [0, 1, 2, 5, 6],
    number_of_seats: 150,
    duration: 300,
    origin_name: 'Midway',
    destination_name: 'Miami International Airport'
  },
  {
    code: 'JB433',
    price: 300,
    departure_time: '7',
    days_of_the_week: [3, 4, 5, 6],
    number_of_seats: 100,
    duration: 240,
    origin_name: 'John F. Kennedy',
    destination_name: 'Miami International Airport'
  },
  {
    code: 'JB242',
    price: 300,
    departure_time: '7',
    days_of_the_week: [0, 1, 3, 4, 5, 6],
    number_of_seats: 100,
    duration: 180,
    origin_name: 'Miami International Airport',
    destination_name: 'John F. Kennedy'
  },
  {
    code: 'JT900',
    price: 600,
    departure_time: '9',
    days_of_the_week: [6],
    number_of_seats: 50,
    duration: 90,
    origin_name: 'Los Angeles International Airport',
    destination_name: 'John F. Kennedy'
  }
]

flights.each do |flight_information|
  origin = Airport.find_by_name(flight_information[:origin_name])
  destination = Airport.find_by_name(flight_information[:destination_name])

  flight = Flight.create(
    code: flight_information[:code],
    price: flight_information[:price],
    departure_time: flight_information[:departure_time],
    days_of_the_week: flight_information[:days_of_the_week],
    number_of_seats: flight_information[:number_of_seats],
    duration: flight_information[:duration],
    origin_id: origin.id,
    destination_id: destination.id
  )

  1.upto(flight.number_of_seats) do |seat_number|
    flight.seats.create(number: seat_number)
  end
end
