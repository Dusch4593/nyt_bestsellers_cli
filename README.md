# New York Times Bestsellers CLI
This is my first CLI project written with Ruby. It is currently a work-in-progress
and there will be many edits to files along with the addition and deletion of
others.

You'll be able to access book information from the New York Times Bestsellers
lists based on a given date and category*.

\* *From the Weekly Bestsellers lists, not the Monthly*

TODO: Wireframe class structure for:
* CLI
* Book
* Category

## Installation

Fork and clone this repository to your local machine. Save it somewhere it'll be easy to find. Then, `cd` to `nyt_bestsellers_cli`.

### Getting an API Key
This project uses the New York Times Books API. As far as I know, you'll have to [sign up for an account](https://developer.nytimes.com/accounts/create) on the New York Times Developer Network in order to be able to generate an API key. You'll need this key to be able to fetch the Book and Category data.

### Working with `dotenv`
For security reasons, it's generally a good idea to take measures to ensure sensitive information isn't exposed to hackers. One of the ways I found was storing the API key as an *environment variable* that can only be seen on your local machine; the actual key isn't seen on the frontend at all.

Be sure to change the name of `example.env` to `.env` and edit:

```
NYT_API_KEY = "your-api-key-here-between-the-quotes"
```


## Usage

TODO: Write usage instructions here

Change into the directory of this repo and enter the following command
in your terminal:

```
$ ruby bin/nyt_bestsellers_cli
```

You'll be welcomed to the program and asked to give a date in this format: `YYYY-MM-DD`

```
Welcome to the New York Times Bestsellers Generator!

Published weekly since 1931, the NYT Bestsellers List has
featured some of America's most successful and widely
read books in the United States!

Unfortunately, the NYT Books API seems to only fetch list data from as far back as June 6th, 2008 (2008-06-02).

Please enter a valid date (YYYY-MM-DD):
```

You'll then be presented with a list of categories; you must select one:

```
Please select a category:
1. Combined Print & E-Book Fiction
2. Combined Print & E-Book Nonfiction
3. Hardcover Fiction
4. Hardcover Nonfiction
5. Paperback Trade Fiction
6. Paperback Nonfiction
7. Advice, How-To & Miscellaneous
8. Children’s Middle Grade Hardcover
9. Children’s Picture Books
10. Children’s Series
11. Young Adult Hardcover
12. E-Book Fiction
13. E-Book Nonfiction
```

Choose a category, and you will then be


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/nyt_bestsellers_cli. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/nyt_bestsellers_cli/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the NytBestsellersCli project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/nyt_bestsellers_cli/blob/master/CODE_OF_CONDUCT.md).
