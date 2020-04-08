module Gettable
  # Used to select categories and books from a numbered list
  def get_index(max_index)
    index = gets.strip.to_i
    if(index.between?(1,max_index))
      index = index - 1
      index
    else
      puts "Invalid Input! Please try again."
      print "Please make a valid choice (1-#{max_index}): "
      self.get_index(max_index)
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
