require 'http'
require 'json'

# This requests my most scrobbled artists from Last.fm
module LastFmApiHelper
  puts '== Last.fm API Helper is loading'

  # Actually make the request
  RESPONSE = HTTP.get(
    'https://ws.audioscrobbler.com/2.0/',
    params: {
      method: 'user.gettopartists',
      user: 'paul_r_schaefer',
      api_key: JSON.parse(File.read('data/secret.json'))['lastfm'],
      limit: 8,
      format: 'json'
    }
  ).freeze

  # I previously thought I would have to loop over the artists here,
  # but it was easier to do in partials/_artists.erb.
  def artists
    if RESPONSE.code == 200
      # Return data to page
      JSON.parse(RESPONSE.to_s)['topartists']['artist']
    else
      # print error message
      "Error Code #{RESPONSE.code}"
    end
  end
end
