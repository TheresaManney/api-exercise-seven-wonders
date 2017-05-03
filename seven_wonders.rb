require 'httparty'

class Seven_Wonders

  BASE_URL =  "https://maps.googleapis.com/maps/api/geocode/json"
  TOKEN = ENV["GOOGLE_API_KEY"]

  def self.coordinates(name)
    url = BASE_URL + "?address=#{name}&" + "token=#{TOKEN}"

    response = HTTParty.get(url)

    find_location = response["results"][0]["geometry"]["location"]

    return find_location
  end
end

#Starter Code:
seven_wonders = ["Great Pyramind of Giza", "Hanging Gardens of Babylon", "Colossus of Rhodes", "Lighthouse of Alexandria", "Statue of Zeus at Olympia", "Temple of Artemis", "Mausoleum at Halicarnassus"]

wonder_info = {}

seven_wonders.each do |wonder|
  wonder_info[wonder] = Seven_Wonders.coordinates(wonder)
end

puts wonder_info


#Example Output:
#{"Great Pyramind of Giza"=>{"lat"=>29.9792345, "lng"=>31.1342019}, "Hanging Gardens of Babylon"=>{"lat"=>32.5422374, "lng"=>44.42103609999999}, "Colossus of Rhodes"=>{"lat"=>36.45106560000001, "lng"=>28.2258333}, "Lighthouse of Alexandria"=>{"lat"=>38.7904054, "lng"=>-77.040581}, "Statue of Zeus at Olympia"=>{"lat"=>37.6379375, "lng"=>21.6302601}, "Temple of Artemis"=>{"lat"=>37.9498715, "lng"=>27.3633807}, "Mausoleum at Halicarnassus"=>{"lat"=>37.038132, "lng"=>27.4243849}}
