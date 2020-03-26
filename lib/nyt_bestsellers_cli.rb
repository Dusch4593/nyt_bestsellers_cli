require "pry"
class NYT_Bestsellers_CLI

  def call
    puts "Welcome to the New York Times Bestsellers List, CLI Edition!"
    puts "------------------------------------------------------------"
    puts "The NYT Bestsellers List has featured some"
    puts "of America's most successful and widely"
    puts "read books in the United States!\n"
    puts "Come search for bestsellers!"
    # ask user to give a date in YYYY-MM-DD format (and it mustn't be before June, 6th, 2008).
    print "Please enter a valid date (YYYY-MM-DD) that is not before 2008-06-02: "
    date = gets.strip

    # ask the user to select a category
    # TODO: This should actually be created from Category objects that
    #       each represent their own category.

    puts "-------------------------------------------------------"
    Category.display_categories
    puts "-------------------------------------------------------"
    print "Please choose a choose a category from the list above: "
    category_index = gets.strip.to_i-1 #input to integer
    chosen_category = Category.load_categories[category_index]
    category_url = chosen_category[:list_name_encoded]

    puts "-------------------------------------------------------"
    # Category.display_books
    chosen_category.display_books(date, category_url)
    # Using a Books.load_books method to create
    # Adds the books (15 max!) to the @books array of that Category instance
    # Iterates through @books and puts out each book.
    puts "-------------------------------------------------------"


    # ask the user if they'd like to support struggling local book stores
    # by visiting indiebound.com and buying local online.

    # ask if they want to go back to the list of Categories

    # ask if they'd like to exit
  end


end
