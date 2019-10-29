class StationDecorator < FuelStation
  def initialize(station_data, location)
    @location = location
    super(station_data)
  end

  def distance
    format_direction_data.distance
  end

  def travel_time
    format_direction_data.travel_time
  end

  def instructions
    format_direction_data.instructions
  end

  private
  attr_reader :location, :fuel_station

  def get_direction_data
    raw_direction_data = google_service.get_google_directon_data
  end

  def format_direction_data
    @directionData ||= DirectionData.new(get_direction_data)
  end

  def google_service
    GoogleApiService.new(location, self.address)
  end

end
