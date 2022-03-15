# Ruby Client for the Testing Regapic API

API Client library for the Testing Regapic API

testing-regapic is the official client library for the Testing Regapic API.

https://github.com/googleapis/googleapis

## Installation

```
$ gem install testing-regapic
```

## Quick Start

```ruby
require "testing/regapic"

client = ::Testing::Regapic::ServiceTranscoding::Client.new
request = ::Testing::Regapic::Request.new # (request fields as keyword arguments...)
response = client.plain_no_template request
```

## Supported Ruby Versions

This library is supported on Ruby 2.5+.

Google provides official support for Ruby versions that are actively supported
by Ruby Core—that is, Ruby versions that are either in normal maintenance or
in security maintenance, and not end of life. Currently, this means Ruby 2.5
and later. Older versions of Ruby _may_ still work, but are unsupported and not
recommended. See https://www.ruby-lang.org/en/downloads/branches/ for details
about the Ruby support schedule.
