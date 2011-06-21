require 'rubygems'
require 'bundler'
Bundler.require(:default, :test)

require 'minitest/autorun'
require 'ruby-debug'
require 'fakeweb'

FakeWeb.allow_net_connect = false

class MiniTest::Unit::TestCase
  include RR::Adapters::TestUnit
end

require File.join(File.dirname(__FILE__), '..', 'tumblr_tags')
