class Tag
  include MongoMapper::Document

  key :name, String, :required => true
  key :count, Integer, :required => true
end
