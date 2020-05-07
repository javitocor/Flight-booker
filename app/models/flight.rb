class Flight < ApplicationRecord
    belongs_to :from_airport, class_name: "Airport"
    belongs_to :to_airport, class_name: "Airport"

    def flight_date_formatted
        self.start.strftime("%m/%d/%Y")
    end

    def time_formatted
        self.start.strftime("%l:%M %P")
    end
end
