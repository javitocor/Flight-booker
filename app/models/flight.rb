class Flight < ApplicationRecord
    belongs_to :from_airport, class_name: "Airport"
    belongs_to :to_airport, class_name: "Airport"
end
