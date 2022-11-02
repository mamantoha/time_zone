# TimeZone

[![Crystal CI](https://github.com/mamantoha/time_zone/actions/workflows/crystal.yml/badge.svg)](https://github.com/mamantoha/time_zone/actions/workflows/crystal.yml)
[![GitHub release](https://img.shields.io/github/release/mamantoha/time_zone.svg)](https://github.com/mamantoha/time_zone/releases)
[![License](https://img.shields.io/github/license/mamantoha/time_zone.svg)](https://github.com/mamantoha/time_zone/blob/main/LICENSE)

The `TimeZone` class serves as a helper to work with time zones in Crystal.

It allows to do the following:

- Limit the set of zones to a meaningful subset of 151 zones.
- Retrieve and display zones with a friendlier name (e.g., "Eastern Time (US & Canada)" instead of "America/New_York").

## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     time_zone:
       github: mamantoha/time_zone
   ```

2. Run `shards install`

## Usage

```crystal
require "time_zone"

zone = TimeZone.new("Taipei")
zone # => #<TimeZone:0x102b64f00 @name="Taipei", @location=#<Time::Location Asia/Taipei>, @utc_offset=28800>
puts zone
# (GMT+08:00) Taipei

zone.local # returns the current time in time zone "Asia/Taipei"
```

## Contributing

1. Fork it (<https://github.com/mamantoha/time_zone/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Anton Maminov](https://github.com/mamantoha) - creator and maintainer
