class Book
  # Class- and instance-level variables
  @@all = []
  attr_accessor :title, :author, :category, :description, :price

  # Initialize object instance with a book title; saved to @@all
  def initialize(title)
    @title = title
    save
  end

  # Get all the Book objects
  def self.all
    @@all
  end

  # Save Book instance to @@all
  def save
    self.class.all << self
  end

  def self.load_books
    
  end

  # Display Book objects in @@all
  def self.display_books

  end

  # Display information for a given Book object
  def display_info

  end
end
