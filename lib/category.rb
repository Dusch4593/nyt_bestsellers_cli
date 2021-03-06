class Category
  # Class- and instance-level variables
  @@all = []
  attr_accessor :display_name, :list_name_encoded

  # Initialize Category object instance with a name, an empty books array
  # Saved to @@all
  def initialize(display_name, list_name_encoded)
    @display_name = display_name
    @list_name_encoded = list_name_encoded
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
    if(self.all.empty?)
      results = NYTimesAPI.fetch_categories
      category_array = results.collect do |result|
        self.new(result[:display_name], result[:list_name_encoded])
      end
    end
  end

  # Displays an ordered list of the Categories
  def self.display_categories
    self.load_categories
    category_array = self.all
    puts "Loading Categories...".colorize(:light_cyan)
    sleep 3
    category_array.each.with_index(1) do |category, index|
        puts "#{index}. #{category.display_name}".colorize(:cyan)
    end
  end

  def display_books_with_category_data(date, category_name, category_url)
    # Use some Book method to use the selected index to access
    books = Book.load_books(date, category_url)
    puts "Loading Best Sellers List...".colorize(:light_cyan)
    sleep 3
    puts "Here are the Top 15 NYT Best Sellers in #{category_name}"
    Book.display_books
  end
end
