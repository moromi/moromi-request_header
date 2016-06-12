# Moromi::RequestHeader

[![Latest Version](https://img.shields.io/gem/v/moromi-request_header.svg)](http://rubygems.org/gems/moromi-request_header)
[![Circle CI](https://circleci.com/gh/moromi/moromi-request_header.svg?style=svg)](https://circleci.com/gh/moromi/moromi-request_header)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'moromi-request_header'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install moromi-request_header

## Usage

- initializers/moromi/request_header.rb

```ruby
Moromi::RequestHeader.configure do |config|
  config.app_name = 'moromi'
end
```

- append to application_controller.rb

```ruby
class ApplicationController < ActionController::Base
  def custom_header
    @custom_header ||= Moromi::RequestHeader::Ios.new(headers: request.headers)
  end
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/moromi/moromi-request_header.
