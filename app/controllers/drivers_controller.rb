class DriversController < ApplicationController

  def index
    if params[:driver_id]
      @driver = Driver.find_by(id: params[:driver_id])
      @trips = @driver.trips
    # How do we use our nested routes here?
    else
      @drivers = Driver.all.order(:name)
    end
  end

  def show
    id = params[:id].to_i
    @driver = Driver.find_by(id: id)
    @trips = @driver.trips.all
    if @driver.nil?
      render :notfound, status: :not_found
    end
  end


  def edit
    @driver = Driver.find(params[:id].to_i)
  end


  def create
    ###### TODO Add error message for if it does not save  #####
    @driver = Driver.new(driver_params)
    if @driver.save
      redirect_to drivers_path
    else
      render :new
    end
  end


  def new
    @driver = Driver.new
  end


  def destroy
    driver = Driver.find_by(id: params[:id].to_i)
    # driver.destroy
    # Instead of deleting, set status to inactive
    driver.status = "inactive"
    redirect_to drivers_path
  end


  def update
    @driver = Driver.find_by(id: params[:id].to_i)
    if @driver.update(driver_params)
    ###### TODO Add error message for if it does not save  #####
    # If it saves, send to show page
      redirect_to driver_path(driver.id)
    else
      # If it doesn't work, render the edit view with validation errors
      render :edit
    end
  end
  private

  def driver_params
    return params.require(:driver).permit(:name, :vin)
  end

end
