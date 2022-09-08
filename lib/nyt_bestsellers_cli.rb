class NYT_Bestsellers_CLI
  include Gettable
  def call
    puts "Welcome to the New York Times Best Seller list, CLI Edition!".colorize(:red)
    puts "------------------------------------------------------------".colorize(:yellow)
    puts "This project uses data from the NYT Books API (https://developer.nytimes.com)"
    puts "The NYT Best Seller list has featured some".colorize(:light_yellow)
    puts "of America's most successful and widely read books!".colorize(:light_yellow)
    puts "Come search for Best Sellers!".colorize(:light_yellow)
    date = pick_date
    category = pick_category
    book = pick_book(category, date)
    get_more_info(date, category, book)
  end

  def pick_date
    # ask user to give a date in YYYY-MM-DD format (and it mustn't be before June, 6th, 2008).
    puts "Unfortunately, the NYT Books API seems to only fetch"
    puts "list data from as far back as June 6th, 2008."
    print "Please enter a valid date: "
    # store a valid date to 'date'
    date = self.get_date
    puts "-------------------------------------------------------".colorize(:yellow)
    date
  end

  def pick_category
    Category.display_categories
    # store chosen category to 'category_index'
    print "Choose a category from the list above: "
    category_index = self.get_index(5)
    chosen_category = Category.all[category_index]
    chosen_category
  end

  def pick_book(category, date)
    category_url = category.list_name_encoded
    category_name = category.display_name
    puts "-------------------------------------------------------".colorize(:yellow)
    category.display_books_with_category_data(date, category_name, category_url)
    puts "-------------------------------------------------------".colorize(:yellow)
    print "Choose a book from the list above to learn more about it: "
    book_index = self.get_index(15)
    chosen_book = Book.all[book_index]
    chosen_book
  end

  def get_more_info(date, category, book)
    puts "-------------------------------------------------------".colorize(:yellow)
    display_info(book)
    print "Would you like to support local book stores and buy online on IndieBound? (y/n): "
    input = gets.strip.downcase
    case input
    when "y"
      book.buy_local
      puts "Thank you for visiting!"
    when "n"
      menu_options(date, category, book)
    else
      puts "Invalid Input! Please try again."
      get_more_info(date, category, book)
    end
  end

  def menu_options(date, category, book)
    puts "-------------------------------------------------------".colorize(:yellow)
    puts "1. Go back to the Best Seller list"
    puts "2. Go back to the Categories"
    puts "3. Search for another Best Seller list"
    puts "4. Exit the program"
    print "Choose an option to continue: "
    input = gets.strip.downcase
    case input
    when "1"
      new_book = pick_book(category, date)
      get_more_info(date, category, new_book)
      menu_options(date, category, book)
    when "2"
      new_category = pick_category
      new_book = pick_book(new_category, date)
      get_more_info(date, new_category, new_book)
      menu_options(date, new_category, new_book)
    when "3"
      call
    when "4"
      puts "Thank you for visiting!"
      exit
    else
      puts "I'm sorry. I didn't understand what you meant."
      menu_options(date, category, book)
    end
  end

  # Display information for a given Book object
  def display_info(book)
    puts "Title: #{book.format_title}"
    puts "Author: #{book.author}"
    puts "Description: #{book.description}"
  end
end
