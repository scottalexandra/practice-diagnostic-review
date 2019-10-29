class GoogleApiService
  def initialize(location, destination)
    @location = location
    @destination = destination
  end

  def get_google_directon_data
    response = get_direction_data
    parse_data(response)
  end

  private
  attr_reader :location, :destination

  def get_direction_data
    Faraday.get('https://maps.googleapis.com/maps/api/directions/json') do |req|
      req.params['origin'] = location
      req.params['destination'] = destination
      req.params['key'] = ENV['google_api_key']
    end
  end

  def parse_data(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
