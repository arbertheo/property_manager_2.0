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
