

class Category
  @@all = []
  attr_accessor :name

  def initialize(name)
    @name = name
    @books = []
    save
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end
end

category_string = "Hardcover Nonfiction"
#binding.pry
hardcover_nonfiction = Category.new(category_string)
