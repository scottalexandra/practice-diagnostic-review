class NrelApiService
  def initialize(location)
    @location = location
  end

  def get_station_data
    raw_data = get_fuel_data
    parse_data(raw_data)[:fuel_stations][0]
  end

  private
  attr_reader :location

  def get_fuel_data
    Faraday.get('https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json') do |req|
      req.params['api_key'] = ENV['nrel_api_key']
      req.params['limit'] = 1
      req.params['fuel_type'] = 'ELEC'
      req.params['location'] = location
    end
  end

  def parse_data(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
