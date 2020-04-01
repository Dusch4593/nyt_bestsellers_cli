module Gettable
  # Used to select categories and books from a numbered list
  def get_index
    index = gets.strip.to_i
    if(index.between?(1,15))
      index = index - 1
      index
    else
      puts "Invalid Input! Please try again."
      print "Please make a valid choice (1-15): "
      self.get_index
    end
  end
end
