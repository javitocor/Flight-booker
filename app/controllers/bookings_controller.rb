class BookingsController < ApplicationController
    def new 
        @booking = Booking.new
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

    def edit
        @booking = Booking.find(params[:id])  
    end

    def update 
        @booking = Booking.find(params[:id])
        if @booking.update(booking_params) 
            redirect_to @booking
        else
            redirect_to 
        end
    end

    def destroy 
        @booking = Booking.find(params[:id])
        @booking.destroy 
        redirect_to root_path
    end

    private

    def booking_params
        params.require(:booking).permit()
    end
end
