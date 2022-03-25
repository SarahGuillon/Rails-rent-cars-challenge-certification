class BookingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :index, :show ]

  def create
    @booking = Booking.new(booking_params)
    @car = Car.find(params[:car_id])

    if current_user.nil?
      return redirect_to new_user_session_path, notice: "Please, log yourself first"
    end
    if @booking.starts_at.nil? || @booking.ends_at.nil?
      return redirect_to car_path(@car), notice: "Dates are incorrect"
    end
    if @booking.starts_at > @booking.ends_at
      return redirect_to car_path(@car), notice: "End date should be superior at start date "
    end
    if @booking.starts_at < DateTime.now
      return redirect_to car_path(@car), notice: "Date must be greater than today's date"
    end

    @booking.car = @car
    @booking.user = current_user
    @booking.accepted = true
    if @booking.save
      redirect_to car_path(@car), notice: "Your booking is confirmed ✅"
    else
      render "cars/show"
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:starts_at, :ends_at)
  end

end
