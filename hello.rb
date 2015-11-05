require 'sinatra'
require 'rubygems'
require 'httparty'

class CoREsriAPI

  include HTTParty
  base_uri 'http://maps.raleighnc.gov/arcgis/rest/services'
  default_params :output => 'json'
  format :json

  def self.getSpecialEventData(precision)
  	data4waze = []
  	query = { "where" => "1=1", "outSR" => "4326", "geometryPrecision" => precision, "f" => "json"}
    response = get('/SpecialEvents/SpecialEventsView/MapServer/0/query', :query => query) # we could add headers here if needed HTTParty.post("https://www.acb.com/api/v2/market/LTC_BTC/", :query => query, :headers => headers )

    if response.success?
  	# 	 response['features'].each do |object|
		 #   	puts object['attributes']
		 #    data4waze << object['attributes']
		 # end		
	   	 # return data4waze
	   	 return response
	else
		raise response.response
	end
  end

end


get '/' do
  "Hello World!"
end

get '/getEventData' do
	 CoREsriAPI.getSpecialEventData('6').to_json
end

