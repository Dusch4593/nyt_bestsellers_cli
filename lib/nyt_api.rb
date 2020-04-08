class NYTimesAPI
  @@base_url = "https://api.nytimes.com/svc/books/v3/lists/"
  @@api_key = ENV["NYT_API_KEY"]
  # This is where I will store the various calls
  # that can be made in the program.

  #There should be a separate definition for
  # each API call

  def self.fetch_bestseller_list(date, category)
    Book.all.clear
    response = RestClient.get("#{self.base_url}#{date}/#{category}.json?api-key=#{self.api_key}")
    response = JSON.parse(response.body, symbolize_names:true)
    results = response[:results][:books]
    results
  end


  def self.fetch_categories
    response = RestClient.get("#{self.base_url}names.json?api-key=#{self.api_key}")
    response = JSON.parse(response.body, symbolize_names:true)
    results = response[:results]
    results = results.slice(0, results.length-54)
    results
  end

  def self.api_key
    @@api_key
  end

  def self.base_url
    @@base_url
  end
end
