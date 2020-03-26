
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

    # What if I made a Category method that creates a hash of these categories
    # and whatever number the user picks is comapred with the category_id of
    # each Category object in the hash?
    puts "-------------------------------------------------------"
    Category.display_categories
    puts "-------------------------------------------------------"
    print "Please choose a choose a category from the list above: "
    category_index= gets.strip.to_i-1

    # take the date and category_index and display
    # the first 15 books fetched from the NYT Books API


    # ask the user if they'd like to support struggling local book stores
    # by visiting indiebound.com and buying local online.

    # ask if they want to go back to the list of Categories

    # ask if they'd like to exit
  end


end
