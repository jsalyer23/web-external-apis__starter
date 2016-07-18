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
	end

	if @city_name == "omaha"
		@city_name = "Omaha"
		@omaha = HTTParty.get("https://api.forecast.io/forecast/#{API_KEY}/41.2524,-95.9980")
		@hourly_temps = City.hourly_temps(@omaha)
	end

	if @city_name == "mumbai"
		@city_name = "Mumbai"
		@mumbai = HTTParty.get("https://api.forecast.io/forecast/#{API_KEY}/19.0760,72.8777")
		@hourly_temps = City.hourly_temps(@mumbai)
	end
  erb :"city_weather"
end
