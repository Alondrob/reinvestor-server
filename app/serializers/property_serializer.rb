class PropertySerializer < ActiveModel::Serializer
  attributes :id, :state, :address, :property_type, :city,
             :county, :neighborhood, :sqft, :beds, :baths, :price,
             :lat, :lon, :image, :status
end
