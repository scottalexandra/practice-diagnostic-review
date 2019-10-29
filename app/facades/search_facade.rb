class SearchFacade
  def initialize(location)
    @location = location
  end

  def get_nearest_station
    station_data = nrel_service.get_station_data
    StationDecorator.new(station_data, location)
  end

  private
  attr_reader :location

  def create_fuel_station(station_data)
    FuelStation.new(station_data)
  end

  def nrel_service
    NrelApiService.new(location)
  end
end
