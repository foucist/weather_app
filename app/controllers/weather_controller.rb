class WeatherController < ApplicationController

  def index
    url =  "https://floral-paper-1590.fly.dev/?latitude=40.75&longitude=-74&transform=true"
    resp = HTTParty.get(url)
    data = JSON.parse(resp.body)

    @daily = data["daily"]
    hourly_2x = data["daily"][Date.today.to_s]["hourly"].to_a + data["daily"][Date.tomorrow.to_s]["hourly"].to_a
    hour = Time.now.hour
    @hourly = 8.times.map {|i| hourly_2x[hour+3*i] }
  end
end
