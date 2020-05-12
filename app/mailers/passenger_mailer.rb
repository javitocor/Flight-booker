class PassengerMailer < ApplicationMailer
    default from: 'flightbooker@example.com'
 
  def thanks_email
    @booking = params[:booking]
    @url  = "http://localhost:3000/bookings/#{@booking.id}"
    mail(to: @booking.passenger.email, subject: 'Thanks for booking with us')
  end
end
