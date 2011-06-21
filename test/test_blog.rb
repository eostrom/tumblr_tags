require File.join(File.dirname(__FILE__), 'test_helper.rb')

describe 'Blog' do
  before do
    @blog = Blog.new(:name => 'erikostrom')
  end
  
  describe 'tags' do
    before do
      new_instance_of(Tumblr::Reader) do |r|
        @post = Object.new
        stub(@post).tags { 'hello,some stuff' }
        stub(r).each_post('erikostrom').yields(@post) {1}
      end
    end
    
    it 'returns a TagCollection' do
      assert TagCollection === @blog.tags
      assert_equal 2, @blog.tags.size
    end
  end

  describe 'tag_url' do
    it 'constructs a URL from the blog name and a tag' do
      assert_equal('http://erikostrom.tumblr.com/tagged/some%20stuff',
        @blog.tag_url('some stuff'))
    end
  end
end
