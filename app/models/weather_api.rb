require "httparty"
require_relative "secret.rb"
require "pry"

class City

	omaha = HTTParty.get("https://api.forecast.io/forecast/#{API_KEY}/41.2524,-95.9980")
	binding.pry
	#This method adds all the hourly temperatures to an Array then returns the Array
	#city = the current city
	def City.hourly_temps(city)
		hourly_temps = []
		city["hourly"]["data"].each do |hour|
			hourly_temps.push(hour["temperature"])
		end
		return hourly_temps
	end


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

	#This method adds each of the day's MAXIMUM temperatures to an Array (returns Array)
	def City.daily_max_temp(city)
		maximum_temps = []
		city["daily"]["data"].each do |day|
			maximum_temps.push(day["temperatureMax"])
		end
		return maximum_temps
	end

	#This method adds each of the day's MINIMUM temperatures to an Array (returns Array)
	def City.daily_min_temp(city)
		minimun_temps = []
		city["daily"]["data"].each do |day|
			minimun_temps.push(day["temperatureMin"])
		end
		return minimun_temps
	end

	# This method selects the current day's summary
	# 
	# city = the selected city's weather data
	#
	# RETURNS STRING (SUMMARY)
	def City.current_temp(city)
		current_temperature = city["currently"]["temperature"]
		return current_temperature
	end

	# This method selects the current summary
	# 
	# city = the selected city's weather data
	#
	# RETURNS STRING (SUMMARY)
	def City.current_summary(city)
		current_summary = city["currently"]["summary"]
		return current_summary
	end

	# This method selects the today's summary
	# 
	# city = the selected city's weather data
	#
	# RETURNS STRING (SUMMARY)
	def City.today_summary(city)
		today_summary = city["daily"]["data"][0]["summary"]
		return today_summary
	end

	# This method selects the sunrise time
	# 
	# city = the selected city's weather data
	#
	# RETURNS INTEGER (TIME)
	def City.sunrise_time(city)
		city["daily"]["data"][0]["sunriseTime"]
	end

	# This method selects the sunset time
	# 
	# city = the selected city's weather data
	#
	# RETURNS INTEGER (TIME)
	def City.sunset_time(city)
		city["daily"]["data"][0]["sunsetTime"]
	end

	# This method selects the precipitaion probability and makes it a percent
	# 
	# city = the selected city's weather data
	#
	# RETURNS FLOAT (PERCENT)
	def City.precip_chance(city)
		city["daily"]["data"][0]["precipProbability"] * 10
	end

	# def City.hourly_time(hour)
	# 	hour = City.current_time

	# end
end



















