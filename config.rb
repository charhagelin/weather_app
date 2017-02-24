require 'google_maps_service'
require 'forecast_io'

ForecastIO.api_key = '200241aa2eca57d1b162699565137181'
# Setup API keys
def get_map_api
  GoogleMapsService::Client.new(key: 'AIzaSyDtMxX6mnJqcKsqyrHqTXPMCcOMTfmXqAU')
end

# @currentlyIn = nil


class Intro
  def initialize #input lat and long, output current temp
    # @lat = lat
    # @long = long
  end

  def hello
    return "welcome..."
  end
end

class Thanks
  def initialize #input lat and long, output current temp
    # @lat = lat
    # @long = long
  end

  def thanks
    return "the end, thanks."
  end
end
