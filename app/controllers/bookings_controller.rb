class BookingsController < ApplicationController
    def new 
        @booking = Booking.new
        @flight = Flight.find(params[:booking])
        @num_passengers = params[:passengers].to_i
        @num_passengers.times { @booking.passenger.build(passenger_params) }
    end

    def create
        @booking = Booking.new(booking_params) 
        if @booking.save
            redirect_to @booking
        else
            @flight = Flight.find(params[:booking][:flight_id])
            render 'new'
        end
    end

    def show 
        @booking = Booking.find(params[:id])
    end

    private

    def booking_params
        params.require(:booking).permit(:flight_id, :passengers_attributes => [:name, :email])
    end

    def passenger_params
        params.require(:booking).permit( passenger:[:name, :email])
    end
end
