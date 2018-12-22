require 'json'
require 'open-uri'
require 'uri'

# This helper makes it easier to change the Google Font included in the page.
# Simply change it in data/global.json and this module does the rest.
module GoogleFontsHelper
  puts '== Google Fonts Helper is loading'

  # Google Fonts API URL
  GOOGLE_APIS = 'https://fonts.googleapis.com/css?family='.freeze

  # Loads global data file...
  CONFIG_FILE = File.read('data/global.json')
  # and parse it as JSON...
  CONFIG_DATA = JSON.parse(CONFIG_FILE)
  # to find the selected font name and weight.
  FONT_NAME   = CONFIG_DATA['google_fonts']['name']
  FONT_WEIGHT = CONFIG_DATA['google_fonts']['weights']

  # Constructs the proper Google Fonts CSS URL
  STYLE_URL = "#{GOOGLE_APIS}#{FONT_NAME.tr(' ', '+')}:#{FONT_WEIGHT}".freeze

  FILE_LOCATION = 'source/stylesheets/_google_fonts.scss'.freeze

  # Saves it as _google_fonts.scss for usage in Sass
  IO.copy_stream(open(STYLE_URL), FILE_LOCATION)

  # Opens file for reading
  SCSS_FILE = File.open(FILE_LOCATION)

  # Searches through file for URLs
  FONT_URLS = URI.extract(SCSS_FILE.read, 'https')

  # Loop over URLs...
  FONT_URLS.each do |url|
    # And remove that stray parenthesis...
    url.tr!(')', '')
  end

  # Closes the file
  SCSS_FILE.close

  # Constructs the class for Tachyons-like usage, and appends it to the file.
  open(FILE_LOCATION, 'a') do |f|
    f.puts ".#{FONT_NAME.parameterize}{font-family:'#{FONT_NAME}',sans-serif}"
  end

  # Outputs font name as class
  def google_font
    FONT_NAME.parameterize
  end

  # Combine all preload tags into a string, and return it to the page
  def google_font_preload_tags
    all_tags = ''
    FONT_URLS.each do |url|
      all_tags << "<link rel=\"preload\" href=\"#{url}\" as=\"font\" type=\"font/ttf\" crossorigin=\"anonymus\">\n"
    end

    all_tags
  end
end
