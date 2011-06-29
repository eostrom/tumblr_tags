require 'tumblr'

class Blog
  include MongoMapper::Document

  key :name, String, :required => true
  key :tags, TagCollection, :required => true
  timestamps!
  
  def tag_url(tag)
    "http://#{name}.tumblr.com/tagged/#{URI.escape(tag)}"
  end
  
  # Fetches tags from Tumblr and saves them, unless we've already
  # done it.
  def update_tags!
    return if updated_at && (updated_at > 1.day.ago)
      
    retrieve_tags!
    save!
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
