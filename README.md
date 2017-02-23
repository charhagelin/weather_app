# Weather app

### Our first team challenge at CFA

We decided to create an app that would return the current weather anywhere in Australia, if the user would like also give a list of the major cities and and their current temperature, and finally be able to provide the user with directions how to get there. 

through this process we used Trello to hold our user stories as well as a program flow.  

![screen shot 2017-02-23 at 5 29 31 pm](https://cloud.githubusercontent.com/assets/24736380/23247593/3299257e-f9ef-11e6-98fc-02947142e464.png)

we wanted to create an app that could:
* return current weather for the location input by the user
* ask the user if they were happy with the current temperature in their location
* if not, it would ask what their ideal temperature would be
* this input would generate a list of places with a current temperature close to the users wish 
* the user would be able to chose a location from this list and request directions how to get there

in the end we created an app that could:
* return current weather for the location input by the user
* ask the user if they want to see a list of major cities and their current temperature 
* if yes, generate a table with major cities in Australia and their current temperature 
* ask the user if they would like directions to any of the listed cities
* if yes, have the user pick a city 
* generate directions to chosen city

During the process of creating this app we had to change a few things we originally planned. 
For one we originally wanted to have the user be able to input a city anywhere on earth, but we ran in to problems with giving directions. In the end we could only give directions within Australia, so we have to limit ourselves to only Australian cities. 
We also count not find a way to generate a list of cities through the input of a temperature.

### User Instructions:

Enter in to terminal:

```ruby weatherAPI.rb```

follow instructions in app. 

#### Installation

In order to run the weather_app properly you will need to install the gems below.
Open your Terminal and run the following commands commands.

##### forecast_io
```sh
$ gem install forecast_io
```
API keys are freely available upon registration at https://darksky.net/dev/docs

##### Terminal Table
```sh
$ gem install terminal-table
```

##### Ruby gem for Google Maps APIs
```sh
$ gem install google_maps_service
```
API keys are freely available with a Google Account at https://developers.google.com/console.
