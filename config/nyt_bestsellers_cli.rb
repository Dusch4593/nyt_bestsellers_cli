require "pry"
require "dotenv"
require "rest-client"
require "json"
Dotenv.load

require_relative "../lib/nyt_bestsellers_cli/version"
require_relative "../lib/book"
require_relative "../lib/category"
require_relative "../lib/nyt_api"
require_relative "../lib/nyt_bestsellers_cli"
