require 'test/unit'
require 'context'
require 'rr'

class Test::Unit::TestCase
  include RR::Adapters::TestUnit
end

require File.join(File.dirname(__FILE__), '..', 'tumblr_tags')
