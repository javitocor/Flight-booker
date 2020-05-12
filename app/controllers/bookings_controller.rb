class BookingsController < ApplicationController
    def new 
        @booking = Booking.new
        @flight = Flight.find(params[:booking])
        @num_passengers = params[:passengers].to_i
        #@passenger = []
        #@num_passengers.times do 
            #@passenger << Passenger.new
        #end
        @num_passengers.times { @booking.build_passenger }       
    end

    def create
        @booking = Booking.new(booking_params) 
        if @booking.save
            PassengerMailer.with(booking: @booking).thanks_email.deliver_now
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
        params.require(:booking).permit(:flight_id, :passenger_attributes => [:id, :name, :email])
    end

    def passenger_params
        params.require(:passenger).permit( :passenger_attributes => [:id, :name, :email])
    end
end
