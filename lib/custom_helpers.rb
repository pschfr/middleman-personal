# Require dependencies
require 'http'
require 'json'
require 'awesome_print'

module Last_FM_API_Helper
	# Constants
	API_URL = 'https://ws.audioscrobbler.com/2.0/'
	API_KEY = '0f680404e39c821cac34008cc4d803db'
	API_LIMIT = 5
	API_USER = 'paul_r_schaefer'
	API_METHOD = 'user.gettopartists'

	def fetch_artists
		# Actually make the request
		response = HTTP.get(API_URL, :params => {
			:method  => API_METHOD,
			:user    => API_USER,
			:api_key => API_KEY,
			:limit   => API_LIMIT,
			:format  => 'json'
		})

		if response.code == 200
			parsed = JSON.parse(response.to_s)['topartists']['artist']
			# Print stuff
			for artist in parsed
				ap artist
			end
		else
			# print error message
			puts 'Error'
		end
	end
end
