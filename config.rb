###
# Compass
###

# Susy grids in Compass
# First: gem install susy
# require 'susy'

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy (fake) files
# page "/this-page-has-no-template.html", :proxy => "/template-file.html" do
#   @which_fake_page = "Rendering a fake page with a variable"
# end

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

# Use LiveReload
activate :livereload, :host => 'localhost'

# Compass configuration
set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'

activate :bower

configure :development do
  set :debug_assets, true
end

activate :jasmine do |options|
  options.debug_assets = true
end


if File.exist? (keysfile = "keys/aws.yml")
  activate :s3_sync do |s3_sync|
    keys = YAML.load_file(keysfile).deep_symbolize_keys
    s3_sync.bucket                 = 'info.clearelection.org'
    s3_sync.region                 = 'us-east-1'
    s3_sync.aws_access_key_id      = keys[:aws_access_key_id]
    s3_sync.aws_secret_access_key  = keys[:aws_secret_access_key]
  end
else
  Kernel.warn "No file #{keysfile} -- not activating s3_sync"
end

# Build-specific configuration
configure :build do
  #ignore 'images/*.psd'
  #ignore 'stylesheets/lib/*'
  #ignore 'stylesheets/vendor/*'
  #ignore 'javascripts/lib/*'
  #ignore 'javascripts/vendor/*'

  activate :asset_hash

  # For example, change the Compass output style for deployment
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript

  # Enable cache buster
  # activate :cache_buster

  # Use relative URLs
  # activate :relative_assets

  # Compress PNGs after build
  # First: gem install middleman-smusher
  # require "middleman-smusher"
  # activate :smusher

  # Or use a different image path
  # set :http_path, "/Content/images/"
end

# hack because of incompatibility between colorize gem and padrino's
# colorizer.  s3_sync uses light_green.  I suspect it used to expect
# colorize gem, but padrino's colorizer (which doesn't support light_green)
# seems to be in effect with the current versions of gems.  Get rid of this
# later, hopefully.
class String::Colorizer
  def self.light_green(target, mode_name=:default)
    value = 62
    mode = modes[mode_name] || modes[:default]
    "\e[#{mode};#{value}m" << target << "\e[0m"
  end
end
