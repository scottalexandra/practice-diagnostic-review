class SearchController < ApplicationController
  def index
    search_facade = SearchFacade.new(params[:location])

    render locals: {
      station: search_facade.get_nearest_station
    }
  end
end
