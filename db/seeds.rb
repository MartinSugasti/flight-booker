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

airlines = %w[AA UN DL SW JB]
300.times do
  airports = Airport.order('RANDOM()')
  code = airlines.sample + rand(100..999).to_s
  next if Flight.find_by_code(code).present?

  Flight.create(
    code: code,
    price: rand(50..800),
    departure_time: rand(0..23).to_s,
    duration: rand(30..420),
    days_of_the_week: [0, 1, 2, 3, 4, 5, 6].sample(rand(1..7)),
    number_of_seats: rand(50..350),
    origin_id: airports.first.id,
    destination_id: airports.second.id
  )
end
