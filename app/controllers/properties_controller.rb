class PropertiesController < ApplicationController
  before_action :authenticate_user!

  def index
    @property = Property.all
  end

  def show
    @properties = Property.find(params[:id])
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
    params.require(:property).permit(:name, :address, :city, :state, :description, :zip)
  end
end
