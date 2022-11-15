class ReportsController < ApplicationController
  protect_from_forgery with: :null_session

  def create
    temperature = (params[:main][:temp] - 273.15).round
    wind_speed = params[:wind][:speed]
    visibility = params[:visibility]
    humidity = params[:main][:humidity]
    clouds = params[:clouds][:all]
    weather = {
      temperature: temperature,
      wind_speed: wind_speed,
      visibility: visibility,
      humidity: humidity,
      clouds: clouds
    }

    User.all.each do |user|
      UserMailer.send_weather_notice_for(user, weather).deliver_now
    end

    head :ok
  end
end
