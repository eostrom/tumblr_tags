require 'tumblr'

class Blog
  include MongoMapper::Document

  key :name, String, :required => true
  key :tags, TagCollection, :required => true

  def tags
    super || retrieve_tags!
  end

  def tag_url(tag)
    "http://#{name}.tumblr.com/tagged/#{URI.escape(tag)}"
  end
  
  private
  
  def retrieve_tags!
    tags = TagCollection.new
    reader.each_post(name) do |post|
      next if post.tags.blank?
      post.tags.split(',').each { |tag| tags.increment_tag(tag) }
    end
    @tags = tags
  end

  def reader
    @reader ||= Tumblr::Reader.new
  end
end
