class Api::V1::CarsController < ApplicationController
  def index
    cars = Car.all
    render json: cars, status: 200
  end

  def show
    car = Car.find_by(id: params[:id])
    if car
      render json: car, status: 200
    else
      render json: {
        error: 'Car not found'
      }
    end
  end

  def create
    car = Car.new(
      name: car_params[:name],
      brand: car_params[:brand],
      image: car_params[:image],
      lending_fee: car_params[:lending_fee],
      description: car_params[:description]
    )
    if car.save
      render json: car, status: 200
    else
      render json: {
        error: 'Error Creating...'
      }
    end
  end

  def destroy
    car = Car.find_by(id: params[:id])
    return unless car

    car.destroy
    render json: 'Car has been deleted'
  end

  private

  def car_params
    params.require(:car).permit(%i[
                                  name
                                  brand
                                  image
                                  lending_fee
                                  description
                                ])
  end
end
