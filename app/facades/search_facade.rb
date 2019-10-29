class SearchFacade
  def initialize(location)
    @location = location
  end

  def get_nearest_station
    station_data = nrel_service.get_station_data
    fuel_station = create_fuel_station(station_data)
    destination = fuel_station.address
    raw_direction_data = google_service(destination).get_google_directon_data
    direction_data = create_direction_data(raw_direction_data)
    create_nearest_station(fuel_station, direction_data)
  end

  private
  attr_reader :location

  def create_direction_data(raw_direction_data)
    DirectionData.new(raw_direction_data)
  end

  def create_fuel_station(station_data)
    FuelStation.new(station_data)
  end

  def create_nearest_station(station, direction_data)
    NearestStation.new(station, direction_data)
  end

  def nrel_service
    NrelApiService.new(location)
  end

  def google_service(destination)
    GoogleApiService.new(location, destination)
  end
end
