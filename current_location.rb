# require 'google_maps_service'
require './config.rb'
# @gmaps = GoogleMapsService::Client.new(key: 'AIzaSyDtMxX6mnJqcKsqyrHqTXPMCcOMTfmXqAU')


class CurrentLocation
  def initialize() #input lat and long, output current temp
    @currentlyIn = currentlyIn
    # @formattedAddress = formattedAddress
  end

  def askLocation()
    puts "Hi, please enter your current location within Australia"
    userInput = gets.chomp
  end

  def is_within_australia_check(hash)
    puts "Checking address is within Australia ..."
    # puts "Country Short Name: #{hash[0][:address_components][3][:short_name]}"

    if hash[0][:address_components][2][:short_name] == "AU"
      puts "IN AUS"
      return true
    else
      puts "NOT IN AUS"
      return false
    end
  end

  def getFormattedAddress(locationInput) #input address or place, output location hash
    puts locationInput
    puts "Validating inputted address ..."
    @gmaps = get_map_api
    hash = @gmaps.geocode(locationInput)
    puts "found #{hash[0][:formatted_address]}"
    self.currentlyIn = hash[0][:formatted_address]
    puts "IN:#{self.currentlyIn}"

    if is_within_australia_check(hash)
      return [true, hash]
    else
      return [false, hash]
    end
  end

  attr_accessor :currentlyIn
end
