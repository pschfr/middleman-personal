# Require global dependencies and helpers
require 'json'
require_relative './lib/google_fonts.rb'
require_relative './lib/last_fm.rb'
require_relative './lib/svg_icons.rb'

# Activate and configure extensions
# https://middlemanapp.com/advanced/configuration/#configuring-extensions
activate :autoprefixer do |prefix|
  prefix.browsers = 'last 2 versions'
end

# Used with Rails Assets and Tachyons
activate :sprockets

# Fixes issues with GitHub pages
# https://github.com/edgecase/middleman-gh-pages#project-page-path-issues
activate :relative_assets
set :relative_links, true

# Adds meta tags with magic
# https://github.com/tiste/middleman-meta-tags
activate :meta_tags

# Layouts
# https://middlemanapp.com/basics/layouts/
# Per-page layout changes
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# Helpers
# Methods defined in the helpers block are available in templates
# https://middlemanapp.com/basics/helper-methods/
helpers GoogleFontsHelper
helpers LastFmApiHelper
helpers SvgIconHelper

# Instagram gem configuration
# https://github.com/agilie/instagram_api_gem
InstagramApi.config do |config|
  config.access_token = JSON.parse(File.read('data/secret.json'))['instagram']
end

# Build-specific configuration
# https://middlemanapp.com/advanced/configuration/#environment-specific-settings
configure :build do
  activate :minify_css
  activate :minify_javascript
  activate :minify_html
end

configure :development do
  # activate :livereload
end
