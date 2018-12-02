# Require dependencies
require 'json'

module Google_Fonts_Helper
	# Google Fonts API URL
	GOOGLE_APIS = 'https://fonts.googleapis.com/css?family='

	# Loads global data file...
	CONFIG_FILE = File.read('data/global.json')
	# and parse it as JSON...
	CONFIG_DATA = JSON.parse(CONFIG_FILE)
	# to find the selected font name and weight.
	FONT_NAME   = CONFIG_DATA['google_fonts']['name']
	FONT_WEIGHT = CONFIG_DATA['google_fonts']['weights']

	# Outputs font name as class
	def google_font_class_name
		return FONT_NAME.parameterize
	end

	# Outputs proper URL for the Google Fonts CSS
	def google_fonts_stylesheet_url
		return "#{GOOGLE_APIS}#{FONT_NAME.gsub(' ', '+')}:#{FONT_WEIGHT}"
	end

	# Outputs CSS class for Tachyons-like usage
	def google_fonts_CSS_class
		return "<style>.#{FONT_NAME.parameterize}{font-family:'#{FONT_NAME}'}</style>"
	end
end
