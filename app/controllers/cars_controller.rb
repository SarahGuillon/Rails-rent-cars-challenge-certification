class CarsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :index,  :show ]

  def index
    @cars = Car.all
  end

  def show
    @car = Car.find(params[:id])
    @user = @car.user
    @booking = Booking.new
  end
end
