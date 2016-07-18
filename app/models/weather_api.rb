require "httparty"
require_relative "secret.rb"
require "pry"

san_francisco = HTTParty.get("https://api.forecast.io/forecast/#{API_KEY}/37.7749,-122.4194")
binding.pry
# sf_hourly_summary = san_francisco["hourly"]["summary"]
# sf_current_temp = san_francisco["currently"]["temperature"]


# omaha = HTTParty.get("https://api.forecast.io/forecast/#{API_KEY}/41.2524,-95.9980")

# omaha_hourly_summary = omaha["hourly"]["summary"]
# omaha_current_temp = omaha["currently"]["temperature"]


# mumbai = HTTParty.get("https://api.forecast.io/forecast/#{API_KEY}/19.0760,72.8777")

# mumbai_hourly_summary = mumbai["hourly"]["summary"]
# mumbai_current_temp = mumbai["currently"]["temperature"]

class City


	#This method adds all the hourly temperatures to an Array then returns the Array
	#city = the current city
	def City.hourly_temps(city)
		hourly_temps = []
		city["hourly"]["data"].each do |hour|
			hourly_temps.push(hour["temperature"])
		end
		return hourly_temps
	end

end