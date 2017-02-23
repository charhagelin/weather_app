require 'terminal-table'
require './config.rb'
require './current_location'
require './current_temp'

# class GoogleAddress #Input: user entered location. Output: google formatted address (hash)
#     def initialize()
#       # @locationInput = locationInput
#       @locationOutput = locationOutput
#     end
#
#     attr_accessor :locationInput, :locationOutput
# end

@currentLocation = nil

@cities = { "Sydney" => [-33.8688,151.2093],
  "Melbourne" => [-37.8136,144.9631],
  "Perth" => [-31.9505,115.8605],
  "Cairns" => [-16.9186,145.7781],
  "Adelaide" => [-34.9285,138.6007],
  "Brisbane" => [-27.4698,153.0251],
  "Canberra" => [-35.2809,149.1300],
  "Gold Coast" => [-28.0167,153.4000]
}

####Methods#####

def getCurrentTemp_raw(lat, long)
  puts "Getting Forcast ..."
  forecast = ForecastIO.forecast(lat,long)
  temp = forecast[:currently][:temperature]
  celtemp = (5*(Float(temp) - 32))/9 #return temp in C
  puts "Caculating Current Temp ..."
  return '%.2f' % celtemp
end





def askUserToSeeMoreCitites
  puts "Would you like to see the current temp for all major cities y/n?"
  user_decision = gets.chomp
  if user_decision == 'y'
    return true
  elsif user_decision == 'n'
    return false
  else
    puts "input not reconised"
    askUserToSeeMoreCitites()
  end
end

def directionsToCity(input)
  city = @cities.keys[input]
  # currentlyIn = currentlyIn
  @gmaps = get_map_api
  puts "IN:#{@currentLocation}"
  puts "TO:#{city}"
  # exit
  route = @gmaps.directions(@currentLocation,city,alternatives: false)
  hash = route[0]
  status = route[1]

  if hash.nil?
    puts "error, empty"
    exit
  end

  legs = hash[:legs]
  steps = legs[0][:steps]

  steps.each do |x|
     output = x[:html_instructions]
     puts output.gsub(/<\/?[^>]*>/, "") #takes away the symbols from the html doc
  end
end


def askUserToTravel()
  puts "Would you like to see directions to one of these cities y/n?"
  user_decision = gets.chomp
  if user_decision == 'y'
    puts "Which city would you like directions to?"
    @cities.each_with_index do |(key,value),index|
      puts "#{index+1} #{key}"
    end
    puts "type the number of the city you would like directions to"
    input = gets.chomp.to_i
    # input = input + 1
    length = @cities.length.to_i
      if input.between?(1,length)
        directionsToCity(input)
      else
        puts "wrong input"
        askUserToTravel()
      end
  elsif user_decision == 'n'
    exit
  else
    puts "input not reconised"
    askUserToTravel()
  end
end

def listCities()

  rows = []
  rows << ['Number', 'Location', 'Temp']
  rows << :separator
  @cities.each_with_index do |(key,value),index|

    temp = getCurrentTemp_raw(value[0], value[1])

    # puts "#{key}: #{temp}
    # "
    rows << [index+1, key, temp] #display row by row
  end

  table = Terminal::Table.new :rows => rows

end

#####MAIN PROGRAM########
# currentLocation = CurrentLocation.new
user_input = CurrentLocation.new.askLocation()
puts "User Input Returned:#{user_input}"

formatted_address = CurrentLocation.new.getFormattedAddress(user_input)
@currentLocation = formatted_address[1][0][:formatted_address]

  if formatted_address[0] == false
    puts "Address not within Australia. Please try again.
    "
    user_input = CurrentLocation.new.askLocation()
  else
    puts "IN 2: #{@currentLocation}"
    temp = CurrentTemp.new.getCurrentTemp(formatted_address[1])
  end

  puts temp
  if askUserToSeeMoreCitites()
    puts listCities()
  else
    exit
  end

askUserToTravel()
