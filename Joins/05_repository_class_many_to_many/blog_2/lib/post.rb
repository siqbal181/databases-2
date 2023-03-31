class Post
  attr_accessor :id, :title, :tags

  def initialize(id:, title:, tags:)
    @id = id
    @title = title
    @tags = tags
  end
end