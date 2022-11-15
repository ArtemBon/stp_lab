class UserMailer < ApplicationMailer
  def send_weather_notice_for(user, weather)
    @temperature = weather[:temperature]
    @wind_speed = weather[:wind_speed]
    @visibility = weather[:visibility]
    @humidity = weather[:humidity]
    @clouds = weather[:clouds]

    @user = user
    mail(to: user.email, subject: 'Екстримальні погодні умови')
  end
end
