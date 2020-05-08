class BookingsController < ApplicationController
    def new 
        @booking = Booking.new
        @flight = Flight.find(params[:booking])
        num_passengers = params[:passengers].to_i
        @passengers = []
        num_passengers.times do
            @passengers << Passenger.new
        end
    end

    def create
        @booking = Booking.new(booking_params) 
        if @booking.save 
            redirect_to @booking
        else
            redirect_to 
        end
    end

    def show 
        @booking = Booking.find(params[:id])
    end

    private

    def booking_params
        params.require(:booking).permit(:flight_id)
    end

    def passenger_params
        params.require(:passenger).permit()
    end
end
