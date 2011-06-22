require File.join(File.dirname(__FILE__), 'test_helper.rb')

describe 'Blog' do
  before do
    @blog = Blog.new(:name => 'erikostrom')
  end
  
  describe 'update_tags!' do
    before do
      post = Tumblr::Post.new
      stub(post).tags { 'hello,some stuff' }
      
      any_instance_of(Tumblr::Reader) do |r|
        stub(r).each_post('erikostrom').yields(post) {1}
      end
    end

    it 'retrieves tags and saves the record' do
      @blog.update_tags!
      
      assert TagCollection === @blog.tags
      assert_equal 2, @blog.tags.size
      assert !@blog.new_record?
    end

    it 'only retrieves tags once' do
      @blog.update_tags!

      blog = Blog.find_by_name(@blog.name)
      mock(blog).save.with_any_args.times(0)
      blog.update_tags!
    end
  end

  describe 'tag_url' do
    it 'constructs a URL from the blog name and a tag' do
      assert_equal('http://erikostrom.tumblr.com/tagged/some%20stuff',
        @blog.tag_url('some stuff'))
    end
  end
end
