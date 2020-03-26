require 'pry'
require_relative "./nyt_api"

class Book
  # Class- and instance-level variables
  @@all = []
  attr_accessor :title, :author, :category, :description, :price, :rank

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

  def self.load_books(date, category)
    # takes a date and category chosen by the user
    # and fetches a NYT Bestsellers list.
    # I'll collect the necessary data to generate individual
    # Book objects.
    results = NYTimesAPI.fetch_bestseller_list(date, category)
    sleep(6)
    books = results.collect do |result|
      book = self.new(result[:title])
      book.author = result[:author]
      book.rank = result[:rank]
      book.price = result[:price]
      book.description = result[:description]
      book.category = category.display_name
    end
    books
  end

  # Display Book objects in @@all
  def self.display_books(books)
    books.each do |book|
      puts "#{rank}. #{book.title} by #{book.author}"
    end
  end

  # Display information for a given Book object
  def display_info

  end
end
