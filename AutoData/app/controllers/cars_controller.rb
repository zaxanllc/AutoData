class CarsController < ApplicationController
  

  def index
    @cars = current_user.cars.order(:name)
    respond_with(@cars)
  end
  
  #redirect to the index action.
  def show
    redirect_to(cars_path)
  end
  
  ##############################################################################
  # Using `respond_with` below will automatically render
  # app/views/cars/new.html.erb 
  
  def new
    @car = current_user.cars.new
    respond_with(@car)
  end
  
  ##############################################################################
  def create
    @car = current_user.cars.create(params[:car])
    respond_with(@car)
  end
  
  ##############################################################################
  def edit
    @car = current_user.cars.find(params[:id])
    respond_with(@car)
  end

  ##############################################################################
  def update
    @car = current_user.cars.find(params[:id])
    @car.update_attributes(params[:car])
    respond_with(@car)
  end
    
  ##############################################################################
  def destroy
    @car = current_user.cars.find(params[:id])
    @car.destroy
    respond_with(@car)
  end
end
