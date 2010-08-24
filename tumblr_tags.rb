require 'rubygems'
require 'bundler'
Bundler.setup

require 'sinatra'
# require 'logger'
require 'haml'
require 'mongo_mapper'

require 'lib/blog'
require 'lib/tag'
require 'lib/tag_collection'

set :root, File.dirname(__FILE__)

configure do
  LOGGER = Logger.new("log/sinatra.log")
  MongoMapper.database = 'tumblr_tags_test'
end

helpers do
  def logger
    LOGGER
  end
end

get '/' do
  haml :home
end

get '/tags' do
  @tags = Blog.find_or_initialize_by_name(params[:blog]).tags || 1

  haml :tags
end
