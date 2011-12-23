class Api::Post < Api::Presenter
  def as_json(*args)
    {
      :id      => id,
      :title   => title,
      :content => content
    }
  end

  def self.create!(*args, &block)
    new(Post.create!(*args, &block))
  end

  def self.find(id)
    new(Post.find(id))
  end
end
