require "httparty"
require_relative "secret.rb"
require "pry"

# san_francisco = HTTParty.get("https://api.forecast.io/forecast/#{API_KEY}/37.7749,-122.4194")
# binding.pry
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

	# def City.today()
	# 	time = Time.now
	# 	return time.wday
	# end

	def City.days_of_week(today)
		days = []
		today = Time.now.wday
		if today == 0
			days.push("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday")
		elsif today == 1
			days.push("Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday", "Monday")
		elsif today == 2
			days.push("Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday", "Monday", "Tuesday")
		elsif today == 3
			days.push("Wednesday", "Thursday", "Friday", "Saturday", "Sunday", "Monday", "Tuesday", "Wednesday")
		elsif today == 4
			days.push("Thursday", "Friday", "Saturday", "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday")
		elsif today == 5
			days.push("Friday", "Saturday", "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday")
		elsif today == 6
			days.push("Saturday", "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday")
		end
		return days
	end

	def City.current_time(time)
		time = Time.now
		return time.hour
	end

	# def City.hourly_time(hour)
	# 	hour = City.current_time

	# end
end



















