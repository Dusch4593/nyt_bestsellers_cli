class Book
  # Class- and instance-level variables
  @@all = []
  attr_accessor :title, :author, :category, :description, :price, :rank, :local_link

  # Initialize object instance with a book title; saved to @@all
  def initialize(title)
    @title = title
    save
  end

  # Get all the Book objects
  def self.all
    @@all
  end

  # Save Book instance to @@all
  def save
    self.class.all << self
  end

  def self.load_books(date, category_url)
    results = NYTimesAPI.fetch_bestseller_list(date, category_url)
    results.collect do |result|
      book = self.new(result[:title])
      book.author = result[:author]
      book.rank = result[:rank]
      book.description = result[:description]
      book.category = category_url.split("-").each{|w| w.capitalize!}.join(" ")
      book.local_link = result[:buy_links].last[:url]
    end
  end

  # Display Book objects in @@all
  def self.display_books
    self.all.each do |book|
      puts "#{book.rank}. #{book.format_title} by #{book.author}".colorize(:magenta)
    end
  end

  def format_title
    title_array = @title.split(" ")
    title_array.each do|w|
      if(w == "THE" || w == "TO" && w == title_array.first)
        w.capitalize!
      elsif(w == "THE" || w == "OF" || w == "AND" || w == "TO")
        w.downcase!
      else
        w.capitalize!
      end
    end
    title_array.join(" ").gsub("and", "&")
  end

  # This opens a a selected Book's page on www.indiebound.org
  def buy_local
    system("open", self.local_link) # Book.url should be a String; this method actually opens a web page!!!
  end
end
