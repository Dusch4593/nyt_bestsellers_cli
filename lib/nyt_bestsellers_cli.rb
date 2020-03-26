
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
    puts "1. Combined Print & E-Book Fiction"
    puts "2. Combined Print & E-Book Nonfiction"
    puts "3. Hardcover Fiction"
    puts "4. Hardcover Nonfiction"
    puts "5. Paperback Trade Fiction"
    puts "6. Paperback Nonfiction"
    puts "7. Advice, How-To & Miscellaneous"
    puts "8. Children’s Middle Grade Hardcover"
    puts "9. Children’s Picture Books"
    puts "10. Children’s Series"
    puts "11. Young Adult Hardcover"
    puts "12. E-Book Fiction"
    puts "13. E-Book Nonfiction"
    puts "Please select a category (1-11): "

    category_input = gets.strip.to_i




  end


end
