require "pry"
require "rest-client"
require "json"
require "colorize"

require_relative "./category.rb"
class NYT_Bestsellers_CLI
  def call
    puts "Welcome to the New York Times Bestsellers List, CLI Edition!".colorize(:red)
    puts "------------------------------------------------------------".colorize(:yellow)
    puts "The NYT Bestsellers List has featured some".colorize(:light_yellow)
    puts "of America's most successful and widely".colorize(:light_yellow)
    puts "read books!".colorize(:light_yellow)
    puts "Come search for bestsellers!".colorize(:light_yellow)

    # store a valid date to 'date'
    date = self.get_date
    puts "-------------------------------------------------------".colorize(:yellow)


    Category.display_categories
    # store chosen category to 'category_index'
    category_index = self.get_category
    chosen_category = Category.all[category_index]
    category_url = chosen_category.list_name_encoded

    puts "-------------------------------------------------------".colorize(:yellow)

    chosen_category.display_books(date, category_url)

    puts "-------------------------------------------------------".colorize(:yellow)
    book_index = self.get_book
    chosen_book = Book.all[book_index]
    puts "-------------------------------------------------------".colorize(:yellow)
    chosen_book.display_info
    print "Would you like to support local book stores during COVID-19 by purchasing online? (y/n): "
    input = gets.strip
    case input.downcase
      when "y"
        chosen_book.buy_local
        puts "Thank you for visiting!"
      when "n"
        puts "Thank you for visiting!"
    end
    puts "-------------------------------------------------------".colorize(:yellow)
  end

  def get_date
    # ask user to give a date in YYYY-MM-DD format (and it mustn't be before June, 6th, 2008).
    puts "Unfortunately, the NYT Books API seems to only fetch list data from as far back as June 6th, 2008 (2008-06-02)"
    print "Please enter a valid date (YYYY-MM-DD): "
    date = gets.strip
    if(/^20[012][0-9]-(0[1-9]|1[0-2])-(0[1-9]|1[0-9]|2[0-9]|3[01])/.match(date))
      date
    else
      puts "Invalid Date! Please try again."
      self.get_date
    end
  end

  def get_category
    print "Please choose a choose a category from the list above: "
    category_index = gets.strip.to_i-1 #input to integer
    if(category_index.between?(1,15))
      category_index
    else
      puts "Invalid choice! Please try again."
      self.get_category
    end
  end

  def get_book
    puts "Choose a book from the list above to learn more about it: "
    book_index = gets.strip.to_i-1
    if(book_index.between?(1,15))
      book_index
    else
      puts "Invalid choice! Please try again."
      self.get_book
    end
  end
end
