class TagCollection
  extend Forwardable
  
  attr_reader :tags

  def initialize(tags = {})
    @tags = tags
  end

  def_delegators :tags, :size, :length, :[]

  def increment_tag(name)
    tags[name] = (tags[name] || 0) + 1
  end

  def self.to_mongo(value)
    # I'm very confused by this. It seems like to_mango is called to
    # convert values to *and* from mongo, and from_mango is never
    # called at all.
    value.respond_to?(:tags) ? value.tags : self.new(value)
  end

  def self.from_mango(value)
    value.is_a?(self) ? value : self.new(value)
  end
  
  def descend_by_count(options = {}, &block)
    tags.to_a.sort_by {|name, count| count}
      .reverse[0..(options[:limit] || 0) - 1]
      .each(&block)
  end
end
