###
# middleman-deploy settings
###
activate :deploy do |deploy|
  deploy.method = :rsync
  deploy.user = "ryan"
  deploy.host = "craftyblues.com"
  deploy.path = "~/public_html/craftyBlues"
end

###
# Blog settings
###

Time.zone = "EST"

activate :blog do |blog|
  #blog.prefix = "blog"
  blog.permalink = "article/:year/:month/:day/:title"
  blog.sources = "article/:year/:month/:day/:title"
  blog.taglink = "article/tags/:tag.html"
  blog.layout = "blog"
  # blog.summary_separator = /(READMORE)/
  # blog.summary_length = 250
  blog.year_link = "article/:year.html"
  blog.month_link = "article/:year/:month.html"
  blog.day_link = "article/:year/:month/:day.html"
  # blog.default_extension = ".markdown"

  blog.tag_template = "tag.html"
  blog.calendar_template = "calendar.html"

  blog.paginate = true
  # blog.per_page = 10
  # blog.page_link = "page/:num"
end

page "/feed.xml", :layout => false

###
# Use LiveReload
###
activate :livereload

###
# Stuff I wrote
###
require "./lib/lil_helpers"
helpers LilHelpers

set :md, :layout_engine => :haml

activate :directory_indexes

page "test.html", :layout => "layouts/test"
set :markdown_engine, :redcarpet
set :markdown, :fenced_code_blocks => true,
               :disable_indented_code_blocks => true
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

set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'

# Build-specific configuration
configure :build do
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
