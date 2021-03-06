class CarsController < ApplicationController
  before_action :set_car, only: [:show, :update, :edit, :destroy]

  def index
    @cars = policy_scope(Car).order(created_at: :desc)
  end

  def new
     @car = Car.new
     authorize @car
  end

  def create
    @car = Car.new(car_params)
    @car.user = current_user
    authorize @car
    if @car.save
      redirect_to cars_path(current_user)
    else
      render :new
    end
  end

  def edit
    authorize @car
     #render
  end

  def update
    authorize @car
    @car.update(car_params)
    redirect_to cars_path(current_user)
  end

  def destroy
    authorize @car
    @car.destroy
    user = @car.user
    redirect_to cars_path(current_user)
  end

  private

  def set_car
    @car = Car.find(params[:id])
  end

  def car_params
    params.require(:car).permit(:license, :brand, :model, :colour)
  end
end
