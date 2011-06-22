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

    
  # def self.to_mongo(value)
  #   value
  # end

  # def self.from_mango(value)
  #   value.is_a?(self) ? value : self.new(value)
  # end
  
  def descend_by_count(options = {}, &block)
    tags.to_a.sort_by {|name, count| count}
      .reverse[0..(options[:limit] || 0) - 1]
      .each(&block)
  end
end
