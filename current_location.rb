require 'google_maps_service'
require './config.rb'
@gmaps = GoogleMapsService::Client.new(key: 'AIzaSyDtMxX6mnJqcKsqyrHqTXPMCcOMTfmXqAU')


class CurrentLocation
  def initialize() #input lat and long, output current temp
    # @userInput = userInput
    # @formattedAddress = formattedAddress
  end

  def askLocation()
    puts "Hi, please enter your current location within Australia"
    userInput = gets.chomp
  end

  def getFormattedAddress(locationInput) #input address or place, output location hash
    puts locationInput
    puts "Validating inputted address ..."
    hash = @gmaps.geocode(locationInput)
    puts "found #{hash[0][:formatted_address]}"
    @currentlyIn = hash[0][:formatted_address]

    if is_within_australia_check(hash)
      return [true, hash]
    else
      return [false, hash]
    end
  end

  attr_accessor :userInput
end
