class DirectionData
  attr_reader :distance, :travel_time, :instructions
  
  def initialize(direction_data)
    @distance = direction_data[:routes][0][:legs][0][:steps][0][:distance][:text]
    @travel_time = direction_data[:routes][0][:legs][0][:steps][0][:duration][:text]
    @instructions = direction_data[:routes][0][:legs][0][:steps][0][:html_instructions]
  end
end
