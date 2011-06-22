require File.join(File.dirname(__FILE__), 'test_helper.rb')

describe 'TagCollection' do
  before do
    @tag_collection = TagCollection.new({ 'few' => 3, 'many' => 15 })
  end

  describe 'increment_tag' do
    it 'adds a tag if none exists' do
      @tag_collection.increment_tag('one')
      assert_equal 1, @tag_collection['one']
    end
    
    it 'increments the count if the tag exists' do
      @tag_collection.increment_tag('few')
      assert_equal 4, @tag_collection['few']
    end
  end
  
  describe 'descend_by_count' do
    it 'calls its block once per tag' do
      counts = [15, 3]

      @tag_collection.descend_by_count do |name, count|
        assert_equal counts.shift, count
      end
    end

    it 'takes a limit option' do
      counts = [15]

      @tag_collection.descend_by_count(:limit => 1) do |name, count|
        assert_equal counts.shift, count
      end
    end
  end
end
