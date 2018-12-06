module SVG_Icons_Helper
	puts "== SVG_Icons_Helper is loading"

	# File path constants
	SOURCE = "source/images/_svg"
	SPRITE = "source/images/_sprite.svg"

	# Anything here will run on Middleman startup.
	# This actually runs the CLI gem svgeez!
	system("svgeez build --source #{SOURCE} --destination #{SPRITE} --with-svgo")

	# Outputs SVG file as inline tag
	def svg_icon_sprite
		return File.read SPRITE
	end

	# Outputs proper HTML for icon
	def svg_icon(name, classes)
		return %Q(
			<svg viewBox='0 0 100 100' class='icon #{classes}'>
				<title>#{name.gsub('-', ' ').titleize}</title>
				<use xlink:href='#_sprite-#{name}'></use>
			</svg>
		)
	end
end
