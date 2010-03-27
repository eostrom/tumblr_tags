require 'rubygems'
require 'sinatra'
require 'logger'
require 'haml'

configure do
  LOGGER = Logger.new("log/sinatra.log")
end

helpers do
  def logger
    LOGGER
  end
end

get '/' do
  haml :home
end
