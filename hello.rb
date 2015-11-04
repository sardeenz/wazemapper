require 'sinatra'
require 'rubygems'
require 'httparty'

class CoREsriAPI

  include HTTParty
  base_uri 'http://maps.raleighnc.gov/arcgis/rest/services'
  default_params :output => 'json'
  format :json

  def self.getSpecialEventData(precision)
  	@display = []
    @eventdata = get('/SpecialEvents/SpecialEventsView/MapServer/0/query?where=1%3D1&outSR=4326&geometryPrecision=6&f=json')
  		 @eventdata['features'].each do |object|
		   	puts object['attributes']
		    @display << object['attributes']
		 end		
		 return @display
  end

end


get '/' do
  "Hello World!"
end

get '/getEventData' do
	 CoREsriAPI.getSpecialEventData('6').to_json
end

