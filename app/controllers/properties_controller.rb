class PropertiesController < ApplicationController
  before_action :authenticate_user!

  def index
    @properties = Property.all
  end

  def show
    @property = Property.find(params[:id])
  end


  def new
    @property = Property.new
  end

  def update
    @property = Property.find(params[:id])
    if @property.update(property_params)
      flash[:success] = 'Property saved successfully'
      redirect_to property_path(@property)
    else
      flash[:alert] = 'Problems updating property'
      @errors = @property.errors.full_messages
      render :edit
    end
  end

  def destroy
    @property = property.find(params[:id])
    if @property.destroy
      flash[:success] = 'Property deleted successfully'
      redirect_to property_path
    else
      flash[:alert] = 'Problems deleting property'
      redirect_to property_path(@property)
    end
  end

  def edit
    @property = Property.find(params[:id])
  end

  def create
    @property = Property.new(property_params)

  if @property.save
    flash[:notice] = "Property added successfully"
    redirect_to @property
  else
    flash[:errors] = @property.errors.full_messages.join(", ")
    render :new

  end
end

  private

  def property_params
    params.require(:property).permit(:address, :unit_id, :rent_amount, :number_of_rooms, :pet_friendly, :occupied_or_not, :rent_deposit, :begining_of_lease_date, :end_of_lease_date)
  end
end
