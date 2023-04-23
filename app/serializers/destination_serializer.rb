class DestinationSerializer

  def serialize_destination_weather(origin, destination, direction_time, weather)
    {
      data: {
          id: nil,
          type: "road trip",
          attributes: {
              start_city: origin,
              end_city: destination,
              travel_time: direction_time,
              weather_at_eta: {
                  datetime: weather[:time],
                  temperature: weather[:temp_f],
                  condition: weather[:condition][:text]
              }
          }
      }
  }
  end

  def serialize_destination_weather_error(origin, destination)
    {
      data: {
          id: nil,
          type: "road trip",
          attributes: {
              start_city: origin,
              end_city: destination,
              travel_time: "impossible",
              weather_at_eta: {}
          }
      }
  }
  end
  
end
