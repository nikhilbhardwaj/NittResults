# NittResults

I wrote this gem so that I could check the results of all my classmates in one go.
It can fetch the result of all the students in the specified range and store the same in a database or
as individual files, the goal is to wrap it up in an ActiveRecord model for easy access and manipulation.

## Installation

Add this line to your application's Gemfile:

    gem 'NittResults'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install NittResults

## Usage

1. Open irb
2. require 'NittResults'
3. include NittResults
4. self.fetch_results(205110001, 205110088)

Replace the range of roll numbers to match your needs.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Future Enhancements
Instead of creating raw textfiles the results would be stored in a
database with an ActiveRecord wrapper to easily query and play around
with.

