require 'rest-client'

class BingSearch
  attr_accessor :url_search_query, :url_search_results

  URL = "https://www.bing.com/search"

  def initialize(url_search_query)
    @url_search_query = url_search_query
  end

  def remove_spaces_with_plus
    @url_search_query.gsub!(/\s/, '+')
  end

  def conduct_search
    remove_spaces_with_plus
    @url_search_results = RestClient.get URL, {params: {q: @url_search_query}}
  end

  def display_search_results
    p @url_search_results.code
    p @url_search_results.cookies
    p @url_search_results.headers
    p @url_search_results.body
  end

  def display_response_code
    p @url_search_results.code
  end

  def display_response_cookies
    p @url_search_results.cookies
  end

  def display_response_headers
    p @url_search_results.headers
  end

  def display_response_body
    p @url_search_results.body
  end
end

# puts "Please enter the search string:"
# search_string = gets.chomp
# bing_search = BingSearch.new(search_string)
# bing_search.conduct_search
# bing_search.display_search_results