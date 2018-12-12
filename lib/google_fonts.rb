require 'json'

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

  # Outputs font name as class
  def google_font_class_name
    FONT_NAME.parameterize
  end

  # Outputs proper URL for the Google Fonts CSS
  def google_fonts_stylesheet_url
    "#{GOOGLE_APIS}#{FONT_NAME.tr(' ', '+')}:#{FONT_WEIGHT}"
  end

  # Outputs CSS class for Tachyons-like usage
  def google_fonts_css_class
    "<style>.#{FONT_NAME.parameterize}{font-family:'#{FONT_NAME}'}</style>"
  end
end
