
set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'


set :site, {
  :name => 'Site Name',
  :desc => 'Customize description in config.rb',
  :google_analytics => 'UA-something from google analytics',
  #:linkedin => 'linkedin id',
  #:github => 'github id',
  :email => 'me@example.com'
} 


# Build-specific configuration
configure :build do
  activate :minify_html
  activate :minify_css
  activate :minify_javascript
  set :js_compressor, Uglifier.new(
    :output => {comments: /^!/},
    :compress => {:unsafe => true}
  )
  activate :asset_hash
  activate :relative_assets
  activate :gzip
  activate :cache_buster
end

activate :directory_indexes

activate :blog do |blog|
  blog.sources = "blog/:year-:month-:day-:name/index.html"
  blog.layout = "post"
  blog.permalink = "blog/:year-:month-:day-:name/index.html"
  blog.summary_separator = /ENDOFSUMMARY/
end

activate :s3_sync do |s3_sync|
  s3_sync.bucket                     = 'S3_BUCKET_NAME_GOES_HERE'
  s3_sync.region                     = 'us-east-1'
  s3_sync.aws_access_key_id          = 'ACCESS_KEY_ID_GOES_HERE'
  s3_sync.aws_secret_access_key      = 'SECRET_ACCESS_KEY_GOES_HERE'
  s3_sync.delete                     = true
  s3_sync.after_build                = false
  s3_sync.prefer_gzip                = true
  s3_sync.path_style                 = true
  s3_sync.reduced_redundancy_storage = false
  s3_sync.acl                        = 'public-read'
  s3_sync.encryption                 = false
  s3_sync.prefix                     = ''
  s3_sync.version_bucket             = false
end

mime_type('.sh', 'text/plain')
mime_type('.java', 'text/plain')
mime_type('.xml', 'text/plain')
mime_type('.py', 'text/plain')
mime_type('.rb', 'text/plain')

caching_policy 'text/html', s_maxage: 60, max_age: 60, must_revalidate: true, proxy_revalidate:true

activate :syntax
set :markdown_engine, :redcarpet
set :markdown, :fenced_code_blocks => true,
               :autolink => true, 
               :smartypants => true

# Include and configure lib/blog_helpers
require 'lib/blog_helpers'
helpers BlogHelpers
