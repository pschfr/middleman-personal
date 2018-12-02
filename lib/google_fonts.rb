# Require dependencies
require 'json'

module Google_Fonts_Helper
	# Google Fonts API URL
	GOOGLE_APIS = 'https://fonts.googleapis.com/css?family='

	# Loads global data file...
	CONFIG_FILE = File.read('data/global.json')
	# and parse it as JSON...
	CONFIG_DATA = JSON.parse(CONFIG_FILE)
	# to find the selected font name.
	FONT_NAME   = CONFIG_DATA['google_font_name']

	# Outputs font name as class
	def google_font_class_name
		# puts FONT_NAME.downcase
		puts FONT_NAME.parameterize
	end

	# Outputs proper URL for the Google Fonts CSS
	def google_fonts_stylesheet_url
		# puts GOOGLE_APIS + FONT_NAME.parameterize(separator: '+')
		puts GOOGLE_APIS + FONT_NAME.gsub!(' ', '+')
	end
end
