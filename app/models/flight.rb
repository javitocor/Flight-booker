class Flight < ApplicationRecord
    belongs_to :from_airport, class_name: "Airport"
    belongs_to :to_airport, class_name: "Airport"

    def flight_date_formatted
        self.start.strftime("%m/%d/%Y")
    end

    def self.search(search_params)
        valid_params = search_params.select{ |key,value| value != ""}
        valid_params[:start] = valid_params[:start].to_time.all_day unless valid_params[:start].nil?     
        where(valid_params)
        #search_params[:start] = search_params[:start].to_time.all_day
        #where(from_airport_id: search_params[:from_airport_id], to_airport_id: search_params[:to_airport_id],
        #start: search_params[:start])
    end
end
