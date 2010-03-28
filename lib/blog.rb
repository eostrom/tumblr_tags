class Blog
  include MongoMapper::Document

  key :name, String, :required => true
  key :tags, Hash, :required => true
end
