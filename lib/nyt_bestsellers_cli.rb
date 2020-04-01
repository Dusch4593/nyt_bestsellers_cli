class NYT_Bestsellers_CLI
  include Gettable
  def call
    puts "Welcome to the New York Times Bestsellers List, CLI Edition!".colorize(:red)
    puts "------------------------------------------------------------".colorize(:yellow)
    puts "This project uses data from the NYT Books API (https://developer.nytimes.com)"
    puts "The NYT Bestsellers List has featured some".colorize(:light_yellow)
    puts "of America's most successful and widely".colorize(:light_yellow)
    puts "read books!".colorize(:light_yellow)
    puts "Come search for bestsellers!".colorize(:light_yellow)
    date = pick_date
    category = pick_category
    book = pick_book(category, date)
    get_more_info(book)
    menu_options(date, category, book)
  end

  def pick_date
    # ask user to give a date in YYYY-MM-DD format (and it mustn't be before June, 6th, 2008).
    puts "Unfortunately, the NYT Books API seems to only fetch list data from as far back as June 6th, 2008 (2008-06-02)"
    print "Please enter a valid date (YYYY-MM-DD): "
    # store a valid date to 'date'
    date = self.get_date
    puts "-------------------------------------------------------".colorize(:yellow)
    date
  end

  def pick_category
    Category.display_categories
    # store chosen category to 'category_index'
    print "Choose a category from the list above: "
    category_index = self.get_index
    chosen_category = Category.all[category_index]
    chosen_category
  end

  def pick_book(category, date)
    category_url = category.list_name_encoded
    puts "-------------------------------------------------------".colorize(:yellow)
    category.display_books(date, category_url)
    puts "-------------------------------------------------------".colorize(:yellow)
    print "Choose a book from the list above to learn more about it: "
    book_index = self.get_index
    chosen_book = Book.all[book_index]
    chosen_book
  end

  def get_more_info(book)
    puts "-------------------------------------------------------".colorize(:yellow)
    book.display_info
  end

  def menu_options(date, category, book)
    print "Would you like to support local book stores and buy online? (#{book.local_link}) during COVID-19 by purchasing online? (y/n): "
    input = gets.strip.downcase
    case input
    when "y"
      chosen_book.buy_local
      puts "Thank you for visiting!"
    when "n"
      puts "-------------------------------------------------------".colorize(:yellow)
      puts "1. Go back to the Bestsellers List"
      puts "2. Go back to the Categories"
      puts "3. Search for another Bestsellers List"
      puts "4. Exit the program"
      print "Choose an option to continue: "
      input = gets.strip.downcase
      case input
      when "1"
        Book.all.clear
        new_book = pick_book(category, date)
        get_more_info(new_book)
        menu_options(date, category, book)
      when "2"
        Book.all.clear
        new_category = pick_category
        new_book = pick_book(new_category, date)
        get_more_info(new_book)
        menu_options(date, new_category, new_book)
      when "3"
        call
      when "4"
        exit
      else
        print "I'm sorry. I didn't understand what you meant."
        menu_options(date, category, book)
      end
    end
  end

  def get_date
    date = gets.strip
    if(/^20[012][0-9]-(0[1-9]|1[0-2])-(0[1-9]|1[0-9]|2[0-9]|3[01])/.match(date))
      date
    else
      print "Invalid Date! Please enter a valid date(YYYY-MM-DD): "
      self.get_date
    end
  end
end
