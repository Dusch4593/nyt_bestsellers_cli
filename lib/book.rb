class Book
  @@all = []
  attr_accessor :title, :author, :category, :description, :price

  def initialize(title)
    @title = title
    save
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
end
