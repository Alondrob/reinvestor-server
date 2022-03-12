# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'uri'
require 'net/http'
require 'openssl'

url = URI("https://realty-in-us.p.rapidapi.com/properties/v2/list-for-sale?city=New%20York%20City&state_code=NY&offset=0&limit=200&sort=relevance")

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_NONE

request = Net::HTTP::Get.new(url)
request["x-rapidapi-host"] = 'realty-in-us.p.rapidapi.com'
request["x-rapidapi-key"] = '4f49e44fe5mshb356fb96b2bc15ap109f78jsne88cc1e9d543'


response = http.request(request)

hash = JSON.parse(response.read_body)

hash["properties"].each do |property|
        sqft = 0
        if property['building_size']
            sqft = property['building_size']['size']
        elsif property['lot_size']
            sqft = property['lot_size']['size'] 
        end
        Property.create(state: property["address"]["state"], address: "#{property['address']['line']} #{property['address']['city']} #{property['address']['state_code']} #{property['address']['postal_code']}", property_type: property['prop_type'], city: property['address']['city'], county: property['address']['county'], neighborhood: property['address']['neighborhood_name'], sqft: sqft, beds: property['beds'], baths: property['baths'], price: property['price'],
        lat: property['address']['lat'], lon: property['address']['lon'], image: property['thumbnail'], status: property['prop_status'] ) 
    end





