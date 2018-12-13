require 'json'
require 'open-uri'

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

  # Saves it as _google_fonts.scss for usage in Sass
  IO.copy_stream(open(STYLE_URL), 'source/stylesheets/_google_fonts.scss')

  # Constructs the class for Tachyons-like usage, and appends it to the file.
  open('source/stylesheets/_google_fonts.scss', 'a') do |f|
    f.puts ".#{FONT_NAME.parameterize}{font-family:'#{FONT_NAME}',sans-serif}"
  end

  # Outputs font name as class
  def google_font
    FONT_NAME.parameterize
  end
end
