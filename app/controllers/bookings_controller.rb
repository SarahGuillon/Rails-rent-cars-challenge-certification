# class CarsController < ApplicationController

#   def create
#     @booking = Car.new(booking_params)
#     @car = Car.find(params[:car_id])

#     @booking.car = @car
#     @booking.user = current_user

#   end

#   private

#   def booking_params
#     params.require(:booking).permit(:starts_at, :ends_at)
#   end

# end
