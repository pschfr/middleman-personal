# This module utilizes the CLI gem svgeez to take a folder of SVG icons
# and compress them into a single file for insertion into the HTML.
module SvgIconHelper
  puts '== SVG Icon Helper is loading'

  # File path constants
  SOURCE = 'source/images/_svg'.freeze
  SPRITE = 'source/images/_sprite.svg'.freeze

  # Anything here will run on Middleman startup.
  # This actually runs the CLI gem svgeez!
  system("svgeez build --source #{SOURCE} --destination #{SPRITE} --with-svgo")

  # Outputs SVG file as inline tag
  def svg_icon_sprite
    File.read SPRITE
  end

  # Outputs proper HTML for icon
  def svg_icon(name, classes)
    %(
      <svg viewBox='0 0 100 100' class='icon #{classes}'>
        <title>#{name.tr('-', ' ').titleize}</title>
        <use xlink:href='#_sprite-#{name}'></use>
      </svg>
    )
  end
end
