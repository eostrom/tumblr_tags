require 'rubygems'
require 'sinatra'
require 'logger'
require 'haml'
require 'mongo_mapper'

require 'lib/blog'
require 'lib/tag'
require 'lib/tag_collection'

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
