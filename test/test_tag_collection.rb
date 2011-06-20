require File.join(File.dirname(__FILE__), 'test_helper.rb')

describe 'TagCollection' do
  before do
    @tag_collection = TagCollection.new(
      [
        Tag.new(:name => 'few', :count => 3),
        Tag.new(:name => 'many', :count => 15)
      ])
  end

  describe 'descend_by_count' do
    it 'calls its block once per tag' do
      counts = [15, 3]

      @tag_collection.descend_by_count do |tag|
        assert_equal counts.shift, tag.count
      end
    end
  end
end
