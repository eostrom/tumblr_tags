require 'rubygems'
require 'bundler/setup'

require 'sinatra'
# require 'logger'
require 'haml'
require 'mongo_mapper'

require 'require_all'
require_rel 'lib'

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
  @blog = Blog.find_or_initialize_by_name(params[:blog])
  @limit = params[:limit].try(:to_i)
  
  haml :tags
end
