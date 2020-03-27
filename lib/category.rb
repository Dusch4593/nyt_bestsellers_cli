require 'pry'
require_relative "./nyt_api"
require_relative "./book.rb"

class Category
  # Class- and instance-level variables
  @@all = []
  attr_accessor :display_name, :list_name_encoded

  # Initialize Category object instance with a name, an empty books array
  # Saved to @@all
  def initialize(display_name, list_name_encoded)
    @display_name = display_name
    @list_name_encoded = list_name_encoded
    @books = []
    save
  end

  # Get @@all
  def self.all
    @@all
  end

  # Save Category object to Category.all
  def save
    self.class.all << self
  end

  # Produces array of 15 Categories from NYT Books API
  def self.load_categories
    # Fetch array of categories from NYT Books API
    # Iterate over results and extract: display_name, list_name_encoded
    #   Create Category objects with that data.
    #   Store each newly created Category in category_array
    # Return category array

    # NOTE: Display a max of 15 categories!
    results = NYTimesAPI.fetch_categories
    category_array = results.collect do |result|
      self.new(result[:display_name], result[:list_name_encoded])
    end
    category_array
  end


  # Displays an ordered list of the Categories
  def self.display_categories

    category_array = self.load_categories
    puts "Loading Categories..."
    sleep 3
    category_array.each.with_index(1) do |category, index|
        puts "#{index}. #{category.display_name}"
    end
  end

  def display_books(date, category)
    # Use some Book method to use the selected index to access
    books = Book.load_books(date, category)
    puts "Loading Bestsellers List..."
    sleep 3
    Book.display_books
  end
end
