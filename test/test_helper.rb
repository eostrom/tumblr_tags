require 'rubygems'
require 'bundler'
Bundler.require(:default, :test)

require 'tu-context'

class Test::Unit::TestCase
  include RR::Adapters::TestUnit
end

require File.join(File.dirname(__FILE__), '..', 'tumblr_tags')
