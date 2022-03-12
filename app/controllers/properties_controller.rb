class PropertiesController < ApplicationController

    def index
        properties = Property.all
        render json: properties
    end

    def show
        property = Property.find(params[:id])
        render json: property
    end


    private
    def property_params
        params.require(:property).permit(:state, address, :property_type, :city, :county, :neighborhood, :sqft, :beds, :baths, :price, :lat, :lon, :image, :status)
    end
    
end
