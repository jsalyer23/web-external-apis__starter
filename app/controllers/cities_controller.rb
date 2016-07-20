MyApp.get "/" do
  erb :"home"
end

MyApp.get "/example" do
  erb :"weather"
end

MyApp.get "/city_weather" do
	@city_name = params[:city]
	# @time = Time.now
	# @today = City.today()
	@today = Time.now.wday
	@weekdays = City.days_of_week(@today)

	if @city_name == "san_francisco"
		@city_name = "San Francisco"
		@san_francisco = HTTParty.get("https://api.forecast.io/forecast/#{API_KEY}/37.7749,-122.4194")
		@hourly_temps = City.hourly_temps(@san_francisco)
		@current_temp = City.current_temp(@san_francisco)
		@current_summary = City.current_summary(@san_francisco)
		@min_temp = City.daily_min_temp(@san_francisco)
		@max_temp = City.daily_max_temp(@san_francisco)
		@today_summary = City.today_summary(@san_francisco)
		@sunrise = City.sunrise_time(@san_francisco)
		@sunset = City.sunset_time(@san_francisco)
		@precip_chance = City.precip_chance(@san_francisco)

	end

	if @city_name == "omaha"
		@city_name = "Omaha"
		@omaha = HTTParty.get("https://api.forecast.io/forecast/#{API_KEY}/41.2524,-95.9980")
		@hourly_temps = City.hourly_temps(@omaha)
		@current_temp = City.current_temp(@omaha)
		@current_summary = City.current_summary(@omaha)
		@min_temp = City.daily_min_temp(@omaha)
		@max_temp = City.daily_max_temp(@omaha)
		@today_summary = City.today_summary(@omaha)
		@sunrise = City.sunrise_time(@omaha)
		@sunset = City.sunset_time(@omaha)
		@precip_chance = City.precip_chance(@omaha)
	end

	if @city_name == "mumbai"
		@city_name = "Mumbai"
		@mumbai = HTTParty.get("https://api.forecast.io/forecast/#{API_KEY}/19.0760,72.8777")
		@hourly_temps = City.hourly_temps(@mumbai)
		@current_temp = City.current_temp(@mumbai)
		@current_summary = City.current_summary(@mumbai)
		@min_temp = City.daily_min_temp(@mumbai)
		@max_temp = City.daily_max_temp(@mumbai)
		@today_summary = City.today_summary(@mumbai)
		@sunrise = City.sunrise_time(@mumbai)
		@sunset = City.sunset_time(@mumbai)
		@precip_chance = City.precip_chance(@mumbai)
	end
  erb :"city_weather"
end
