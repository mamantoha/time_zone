# TimeZone

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

zone = TimeZone.new("Berlin")
#<TimeZone:0x7f10a7dc5f00 @name="Central Time (US & Canada)", @location=#<Time::Location America/Chicago>, @utc_offset=-18000>
puts zone
# (GMT+02:00) Berlin

Time.local(zone.location) # returns the current time in time zone "Europe/Berlin""
```

## Contributing

1. Fork it (<https://github.com/mamantoha/time_zone/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Anton Maminov](https://github.com/mamantoha) - creator and maintainer
