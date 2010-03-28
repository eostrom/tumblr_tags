# This file goes in domain.com/config.ru
require 'rubygems'
require 'sinatra'

set :env,  :production
disable :run

require 'tumblr_tags'

FileUtils.mkdir_p 'log' unless File.exists?('log')
log = File.new("log/sinatra.log", "a")
$stdout.reopen(log)
$stderr.reopen(log)

run Sinatra::Application
