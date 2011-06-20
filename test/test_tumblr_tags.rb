require File.join(File.dirname(__FILE__), 'test_helper.rb')
require 'rack/test'

describe 'TumblrTags' do
  include Rack::Test::Methods
  include Webrat::Matchers

  def app; Sinatra::Application; end
  def response_body; last_response.body; end

  describe '/tags' do
    before do
      @blog = mock(Blog).find_or_initialize_by_name('erikostrom').mock!
      @blog.tags do
        TagCollection.new [
          Tag.new(:name => 'few', :count => 3),
          Tag.new(:name => 'many things', :count => 15)
        ]
      end

      get '/tags', :blog => 'erikostrom'
    end

    it 'renders a list of tags' do
      assert last_response.ok?, last_response.errors

      assert_have_selector 'ul#tumblr_tags'
      assert_have_selector 'ul#tumblr_tags li', :count => 2
      #         assert_have_selector('ul#tumblr_tags li:first-child a',
      #           :href => 'http://erikostrom.tumblr.com/tagged/many%20things')
      assert_have_selector('ul#tumblr_tags li:first-child .tag',
        :content => 'many things')
      assert_have_selector('ul#tumblr_tags li:first-child .count',
        :content => '15')
    end
  end
end


