# RhodeIsland

A really, really small state machine for Ruby on Rails

## Installation

Add this line to your application's Gemfile:

    gem 'rhode_island'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rhode_island

## Usage

1. Add a state column to your model and migrate your database
2. In your model add the line 'include RhodeIsland'
3. Add a STATES constant in your model that is an array of states as strings


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
