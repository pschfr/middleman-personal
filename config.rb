# Require global dependencies and helpers
require 'require_all'
require_all 'lib'

# Activate and configure extensions
# https://middlemanapp.com/advanced/configuration/#configuring-extensions
activate :autoprefixer do |prefix|
  prefix.browsers = "last 2 versions"
end

# Used with Rails Assets and Tachyons
activate :sprockets

# Fixes issues with GitHub pages
# https://github.com/edgecase/middleman-gh-pages#project-page-path-issues
activate :relative_assets
set :relative_links, true

# Layouts
# https://middlemanapp.com/basics/layouts/
# Per-page layout changes
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# Helpers
# Methods defined in the helpers block are available in templates
# https://middlemanapp.com/basics/helper-methods/
helpers Last_FM_API_Helper
helpers Google_Fonts_Helper
helpers SVG_Icons_Helper

# Instagram gem configuration
# https://github.com/agilie/instagram_api_gem
InstagramApi.config do |config|
  config.access_token = '2092274.1677ed0.58ecb89ee52c47ab8ac5797f7564165c'
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
