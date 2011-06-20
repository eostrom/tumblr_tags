app_file = File.join(File.dirname(__FILE__), *%w[.. .. tumblr_tags.rb])

require app_file
# Force the application name because polyglot breaks the auto-detection logic.
Sinatra::Application.app_file = app_file

require 'ruby-debug'

require 'test/unit'
require 'rack/test'

require 'cucumber/web/tableish'

require 'webrat'

Webrat.configure do |config|
  config.mode = :rack
end

# Don't generate fancy HTML for stack traces.
disable :show_exceptions
# Allow errors to get out of the app so Cucumber can display them.
enable :raise_errors

module Webrat
  module Logging
    def logger
      @logger ||= ::Logger.new('log/webrat.log')
    end
  end
end

class MyWorld
  include Cucumber::Web::Tableish
  include Test::Unit::Assertions
  include Rack::Test::Methods
  include Webrat::Methods
  include Webrat::Matchers

  Webrat::Methods.delegate_to_session :response_code, :response_body

  def app
    Sinatra::Application
  end
end

World{MyWorld.new}
