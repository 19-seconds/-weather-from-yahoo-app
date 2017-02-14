class ForecastsController < ApplicationController

  def index
    city = params[:city] || "Kigali"
    country = params[:country] || "Rwanda"


    weather_hash = Unirest.get("https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20weather.forecast%20where%20woeid%20in%20(select%20woeid%20from%20geo.places(1)%20where%20text%3D%22#{city}%2C%20#{country}%22)&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys").body
    @location_and_time = weather_hash["query"]["results"][
      "channel"]["title"]
    @forecast = weather_hash["query"]["results"]["channel"]["item"]["condition"]
    @five_day_forecasts = weather_hash["query"]["results"]["channel"]["item"]["forecast"]
    @five_day_forecasts = @five_day_forecasts[0..4]
  end


end
