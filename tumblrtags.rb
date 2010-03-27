require 'rubygems'
require 'sinatra'
require 'logger'

configure do
  LOGGER = Logger.new("log/sinatra.log")
end

helpers do
  def logger
    LOGGER
  end
end

get '/' do
  "Coming soon..."
end
