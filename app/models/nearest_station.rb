class NearestStation
  attr_reader :name, :address, :fuel_type, :access_times, :distance, :travel_time, :instructions

  def initialize(fuel_station, direction_data)
    @name = fuel_station.name
    @address = fuel_station.address
    @fuel_type = fuel_station.fuel_type
    @access_times = fuel_station.access_times
    @distance = direction_data.distance
    @travel_time = direction_data.travel_time
    @instructions = direction_data.instructions
  end
end
