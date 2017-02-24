class CurrentTemp
  def initialize #input lat and long, output current temp
    # @lat = lat
    # @long = long
  end

  def getCurrentTemp(hash)
    # puts '&' * 40
    # puts "hash: #{hash}"
    # puts '&' * 40
    lat_long = extractLatLong(hash)
    puts "Getting Forecast ..."
    forecast = ForecastIO.forecast(lat_long[0],lat_long[1])
    temp = forecast[:currently][:temperature]
    celtemp = (5*(Float(temp) - 32))/9 #return temp in C
    puts "Calculating Current Temp ..."
    result = '%.2f' % celtemp
    # puts '&' * 40
    # puts "result: #{result}"
    # puts '&' * 40
    result
  end

  def extractLatLong(hash) # get the lat and long from the hash
    puts "Extracting Lat and Long ..."
    # puts hash
    lat = hash[0][:geometry][:location][:lat]
    long = hash[0][:geometry][:location][:lng]
    return [lat, long]
  end

  attr_accessor :lat, :long

end
