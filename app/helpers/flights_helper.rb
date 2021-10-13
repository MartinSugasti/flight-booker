module FlightsHelper
  def options_for_airport
    City.all.each_with_object({}) do |city, result|
      result[city.name] = []
      city.airports.each do |airport|
        result[city.name] << [airport.name, airport.id]
      end
    end
  end
end
