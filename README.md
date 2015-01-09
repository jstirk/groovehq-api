# Groovehq

A quick and super dirty Ruby gem for creating tickets via the [Groove API](https://www.groovehq.com/docs).

It should definitely not be used for any production level uses.

## Installation

Add this line to your application's Gemfile:

    gem 'groovehq'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install groovehq

## Usage

```ruby
require 'groovehq'
Groovehq.auth_token = 'AAAAA'
t = Groovehq::Ticket.new
t.body = "A\nVery\nVery\nLong\nBody"
t.from_email = 'jstirk@example.com'
t.from_name = 'Jason Stirk'
t.to_email = 'contact@example.com.au'
t.tags = [ :web ]

t.save!
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
