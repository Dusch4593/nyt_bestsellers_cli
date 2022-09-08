# New York Times Best Seller CLI

This is my command line interface (CLI) project is written in Ruby.

You can access book information from the New York Times Best Seller
list based on a given date and category*.

\* _From the Weekly Best Seller lists, not the Monthly_

## Installation

Fork and clone this repository to your local machine. Save it somewhere it'll be easy to find. Then, `cd` into `nyt_bestsellers_cli`.

### Getting an API Key

This project uses the New York Times Books API. As far as I know, you'll have to [sign up for an account](https://developer.nytimes.com/accounts/create) on the New York Times Developer Network in order to be able to generate an API key. You'll need this key to be able to fetch the Book and Category data.

### Working with `dotenv`

For security reasons, it's generally a good idea to take measures to ensure sensitive information isn't exposed to hackers. One of the ways I found was storing the API key as an *environment variable* that can only be seen on your local machine; the actual key isn't seen on the frontend at all.

Be sure to change the name of `example.env` to `.env` and assign to the `NYT_API_KEY`:

```
NYT_API_KEY = "your-api-key-here-between-the-quotes"
```

## Usage

Change into the directory of this repo and run the following command
in your terminal:

```
$ ruby bin/nyt_bestsellers_cli
```

You'll be welcomed to the program and asked to provide a valid date in one of the following formats:

- `YYYY-MM-DD`
- `MM-DD-YYYY`
- `M-D-YYYY`
- `M-DD-YYYY` / `MM-D-YYYY`

```
Welcome to the New York Times Best Seller list, CLI Edition!
------------------------------------------------------------
This project uses data from the NYT Books API (https://developer.nytimes.com)
The NYT Best Seller list has featured some
of America's most successful and widely read books!
Come search for Best Sellers!
Unfortunately, the NYT Books API seems to only fetch
list data from as far back as June 6th, 2008.
Please enter a valid date:
```

You'll then be presented with a list of categories; you must select one by
entering its corresponding number.

Choose a category, and you will then be shown the NYT Best Seller list based
on the date you gave.

Select a book to get more information.

At the end of the program, you'll be asked if you'd like to
help support local book stores near you. If you type `y` your Internet browser will direct you to
[www.indiebound.org](https://www.indiebound.org/) where you can buy the selected book from a local store.

Please enjoy and feel free to let me know if you have any issues with
setup or usage! 

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Dusch4593/nyt_bestsellers_cli. This project is intended to be a safe, welcoming space for collaboration.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the NytBestsellersCli project's codebases, issue trackers, chat rooms, and mailing lists is expected to follow the [code of conduct](https://github.com/Dusch4593/nyt_bestsellers_cli/blob/master/CODE_OF_CONDUCT.md).
