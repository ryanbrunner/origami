class Post
  include Mongoid::Document
  
  field :title, type: String
  field :content, type: String
  field :published, type: Boolean
  
  validates_presence_of :title
end
