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

      # Using a real TagCollection here means we aren't getting good
      # isolation of the app/view, but it's too much of a pain to mock
      # multiple yields from descend_by_count.
      @blog.tags { TagCollection.new({'few' => 3, 'many things' => 15}) }
      
      # These aren't real URLs, but we don't need them to be; we
      # just need something we can test for in the output.
      @blog.tag_url('many things') { 'TAG_URL(many things)' }
    end

    it 'renders a list of tags' do
      @blog.tag_url('few') { 'TAG_URL(few)' }
      
      get '/tags', :blog => 'erikostrom'
      
      assert last_response.ok?, last_response.errors

      assert_have_selector 'ul#tumblr_tags'
      assert_have_selector 'ul#tumblr_tags li', :count => 2
      assert_have_selector('ul#tumblr_tags li:first-child a',
        :href => 'TAG_URL(many things)')
      assert_have_selector('ul#tumblr_tags li:first-child .tag',
        :content => 'many things')
      assert_have_selector('ul#tumblr_tags li:first-child .count',
        :content => '15')
    end

    describe 'with a limit' do
      it 'renders fewer tags' do
        get '/tags', :blog => 'erikostrom', :limit => '1'

        assert_have_selector('ul#tumblr_tags li .tag',
          :content => 'many things')
        assert_have_no_selector('ul#tumblr_tags li .tag',
          :content => 'few')
      end
    end
  end
end


