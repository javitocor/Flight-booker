class FlightsController < ApplicationController
    def index
        @airport_option = Airport.all.map{ |u| [ u.name, u.id ] }
        @passenger_option = [1, 2, 3, 4]
        @date_option = Flight.order('start ASC').map{ |x| [x.flight_date_formatted, x.start] }
        @results = Flight.search(search_params)
    end

    private

    def search_params
      params.require(:flight).permit(:from_airport_id, :to_airport_id, :start, :passengers)
    end
end
