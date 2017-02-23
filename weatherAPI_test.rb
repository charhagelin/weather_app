require 'test/unit'
require './current_location'
require './current_temp'

# class CurrentLocation_Test < Test::Unit::TestCase
#
#   # def test_ask_location
#   #   formattedAddress = CurrentLocation.new
#   #
#   #   actual = formattedAddress[1][0][:formatted_address]  #what is the actual input
#   # #  expected =    #what is the expected output
#   #
#   #   assert_not_nil(actual) #testing that it actually contains something
#   # end
# end
# class CurrentTempTest < Test::Unit::TestCase
#
# end

class CurrentLocationTest < Test::Unit::TestCase
  def test_current_location_class_initializes
    new_object = CurrentLocation.new
    assert_equal new_object.class, CurrentLocation
  end

  def test_get_current_location
    new_obj = CurrentLocation.new

    test_input = "sydney"
    test_array = [{:address_components=>[{:long_name=>"Sydney", :short_name=>"Sydney", :types=>["colloquial_area", "locality", "political"]}, {:long_name=>"New South Wales", :short_name=>"NSW", :types=>["administrative_area_level_1", "political"]}, {:long_name=>"Australia", :short_name=>"AU", :types=>["country", "political"]}], :formatted_address=>"Sydney NSW, Australia", :geometry=>{:bounds=>{:northeast=>{:lat=>-33.5781409, :lng=>151.3430209}, :southwest=>{:lat=>-34.118347, :lng=>150.5209286}}, :location=>{:lat=>-33.8688197, :lng=>151.2092955}, :location_type=>"APPROXIMATE", :viewport=>{:northeast=>{:lat=>-33.5782519, :lng=>151.3429976}, :southwest=>{:lat=>-34.118328, :lng=>150.5209286}}}, :place_id=>"ChIJP3Sa8ziYEmsRUKgyFmh9AQM", :types=>["colloquial_area", "locality", "political"]}]

    test_result = [true, test_array]
    method = new_obj.getFormattedAddress(test_input)

    assert_equal method, test_result
  end
  # def test_get_current_temp
  #   new_current_temp = CurrentTemp.new
  #   actual = new_current_temp.getCurrentTemp({})
  #   expected = {}
  #   assert_equal actual, expected
  # end
  # new_current_temp = CurrentTemp.new
  # puts new_current_temp.class
  # assert_equal new_current_temp.class,
  # city_data = { "Sydney" => [-33.8688,151.2093],
  #   "Melbourne" => [-37.8136,144.9631],
  #   "Perth" => [-31.9505,115.8605],
  #   "Cairns" => [-16.9186,145.7781],
  #   "Adelaide" => [-34.9285,138.6007],
  #   "Brisbane" => [-27.4698,153.0251],
  #   "Canberra" => [-35.2809,149.1300],
  #   "Gold Coast" => [-28.0167,153.4000]
  #  }
  # assert_equal @cities, city_data
end
