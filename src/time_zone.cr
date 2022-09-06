class TimeZone
  @@zones = [] of TimeZone

  # Keys are TimeZone names, values are TZ database names (https://en.wikipedia.org/wiki/List_of_tz_database_time_zones).
  MAPPING = {
    "International Date Line West" => "Etc/GMT+12",
    "Midway Island"                => "Pacific/Midway",
    "American Samoa"               => "Pacific/Pago_Pago",
    "Hawaii"                       => "Pacific/Honolulu",
    "Alaska"                       => "America/Juneau",
    "Pacific Time (US & Canada)"   => "America/Los_Angeles",
    "Tijuana"                      => "America/Tijuana",
    "Mountain Time (US & Canada)"  => "America/Denver",
    "Arizona"                      => "America/Phoenix",
    "Chihuahua"                    => "America/Chihuahua",
    "Mazatlan"                     => "America/Mazatlan",
    "Central Time (US & Canada)"   => "America/Chicago",
    "Saskatchewan"                 => "America/Regina",
    "Guadalajara"                  => "America/Mexico_City",
    "Mexico City"                  => "America/Mexico_City",
    "Monterrey"                    => "America/Monterrey",
    "Central America"              => "America/Guatemala",
    "Eastern Time (US & Canada)"   => "America/New_York",
    "Indiana (East)"               => "America/Indiana/Indianapolis",
    "Bogota"                       => "America/Bogota",
    "Lima"                         => "America/Lima",
    "Quito"                        => "America/Lima",
    "Atlantic Time (Canada)"       => "America/Halifax",
    "Caracas"                      => "America/Caracas",
    "La Paz"                       => "America/La_Paz",
    "Santiago"                     => "America/Santiago",
    "Newfoundland"                 => "America/St_Johns",
    "Brasilia"                     => "America/Sao_Paulo",
    "Buenos Aires"                 => "America/Argentina/Buenos_Aires",
    "Montevideo"                   => "America/Montevideo",
    "Georgetown"                   => "America/Guyana",
    "Puerto Rico"                  => "America/Puerto_Rico",
    "Greenland"                    => "America/Godthab",
    "Mid-Atlantic"                 => "Atlantic/South_Georgia",
    "Azores"                       => "Atlantic/Azores",
    "Cape Verde Is."               => "Atlantic/Cape_Verde",
    "Dublin"                       => "Europe/Dublin",
    "Edinburgh"                    => "Europe/London",
    "Lisbon"                       => "Europe/Lisbon",
    "London"                       => "Europe/London",
    "Casablanca"                   => "Africa/Casablanca",
    "Monrovia"                     => "Africa/Monrovia",
    "UTC"                          => "Etc/UTC",
    "Belgrade"                     => "Europe/Belgrade",
    "Bratislava"                   => "Europe/Bratislava",
    "Budapest"                     => "Europe/Budapest",
    "Ljubljana"                    => "Europe/Ljubljana",
    "Prague"                       => "Europe/Prague",
    "Sarajevo"                     => "Europe/Sarajevo",
    "Skopje"                       => "Europe/Skopje",
    "Warsaw"                       => "Europe/Warsaw",
    "Zagreb"                       => "Europe/Zagreb",
    "Brussels"                     => "Europe/Brussels",
    "Copenhagen"                   => "Europe/Copenhagen",
    "Madrid"                       => "Europe/Madrid",
    "Paris"                        => "Europe/Paris",
    "Amsterdam"                    => "Europe/Amsterdam",
    "Berlin"                       => "Europe/Berlin",
    "Bern"                         => "Europe/Zurich",
    "Zurich"                       => "Europe/Zurich",
    "Rome"                         => "Europe/Rome",
    "Stockholm"                    => "Europe/Stockholm",
    "Vienna"                       => "Europe/Vienna",
    "West Central Africa"          => "Africa/Algiers",
    "Bucharest"                    => "Europe/Bucharest",
    "Cairo"                        => "Africa/Cairo",
    "Helsinki"                     => "Europe/Helsinki",
    "Kyiv"                         => "Europe/Kyiv",
    "Riga"                         => "Europe/Riga",
    "Sofia"                        => "Europe/Sofia",
    "Tallinn"                      => "Europe/Tallinn",
    "Vilnius"                      => "Europe/Vilnius",
    "Athens"                       => "Europe/Athens",
    "Istanbul"                     => "Europe/Istanbul",
    "Minsk"                        => "Europe/Minsk",
    "Jerusalem"                    => "Asia/Jerusalem",
    "Harare"                       => "Africa/Harare",
    "Pretoria"                     => "Africa/Johannesburg",
    "Kaliningrad"                  => "Europe/Kaliningrad",
    "Moscow"                       => "Europe/Moscow",
    "St. Petersburg"               => "Europe/Moscow",
    "Volgograd"                    => "Europe/Volgograd",
    "Samara"                       => "Europe/Samara",
    "Kuwait"                       => "Asia/Kuwait",
    "Riyadh"                       => "Asia/Riyadh",
    "Nairobi"                      => "Africa/Nairobi",
    "Baghdad"                      => "Asia/Baghdad",
    "Tehran"                       => "Asia/Tehran",
    "Abu Dhabi"                    => "Asia/Muscat",
    "Muscat"                       => "Asia/Muscat",
    "Baku"                         => "Asia/Baku",
    "Tbilisi"                      => "Asia/Tbilisi",
    "Yerevan"                      => "Asia/Yerevan",
    "Kabul"                        => "Asia/Kabul",
    "Ekaterinburg"                 => "Asia/Yekaterinburg",
    "Islamabad"                    => "Asia/Karachi",
    "Karachi"                      => "Asia/Karachi",
    "Tashkent"                     => "Asia/Tashkent",
    "Chennai"                      => "Asia/Kolkata",
    "Kolkata"                      => "Asia/Kolkata",
    "Mumbai"                       => "Asia/Kolkata",
    "New Delhi"                    => "Asia/Kolkata",
    "Kathmandu"                    => "Asia/Kathmandu",
    "Astana"                       => "Asia/Dhaka",
    "Dhaka"                        => "Asia/Dhaka",
    "Sri Jayawardenepura"          => "Asia/Colombo",
    "Almaty"                       => "Asia/Almaty",
    "Novosibirsk"                  => "Asia/Novosibirsk",
    "Rangoon"                      => "Asia/Rangoon",
    "Bangkok"                      => "Asia/Bangkok",
    "Hanoi"                        => "Asia/Bangkok",
    "Jakarta"                      => "Asia/Jakarta",
    "Krasnoyarsk"                  => "Asia/Krasnoyarsk",
    "Beijing"                      => "Asia/Shanghai",
    "Chongqing"                    => "Asia/Chongqing",
    "Hong Kong"                    => "Asia/Hong_Kong",
    "Urumqi"                       => "Asia/Urumqi",
    "Kuala Lumpur"                 => "Asia/Kuala_Lumpur",
    "Singapore"                    => "Asia/Singapore",
    "Taipei"                       => "Asia/Taipei",
    "Perth"                        => "Australia/Perth",
    "Irkutsk"                      => "Asia/Irkutsk",
    "Ulaanbaatar"                  => "Asia/Ulaanbaatar",
    "Seoul"                        => "Asia/Seoul",
    "Osaka"                        => "Asia/Tokyo",
    "Sapporo"                      => "Asia/Tokyo",
    "Tokyo"                        => "Asia/Tokyo",
    "Yakutsk"                      => "Asia/Yakutsk",
    "Darwin"                       => "Australia/Darwin",
    "Adelaide"                     => "Australia/Adelaide",
    "Canberra"                     => "Australia/Melbourne",
    "Melbourne"                    => "Australia/Melbourne",
    "Sydney"                       => "Australia/Sydney",
    "Brisbane"                     => "Australia/Brisbane",
    "Hobart"                       => "Australia/Hobart",
    "Vladivostok"                  => "Asia/Vladivostok",
    "Guam"                         => "Pacific/Guam",
    "Port Moresby"                 => "Pacific/Port_Moresby",
    "Magadan"                      => "Asia/Magadan",
    "Srednekolymsk"                => "Asia/Srednekolymsk",
    "Solomon Is."                  => "Pacific/Guadalcanal",
    "New Caledonia"                => "Pacific/Noumea",
    "Fiji"                         => "Pacific/Fiji",
    "Kamchatka"                    => "Asia/Kamchatka",
    "Marshall Is."                 => "Pacific/Majuro",
    "Auckland"                     => "Pacific/Auckland",
    "Wellington"                   => "Pacific/Auckland",
    "Nuku'alofa"                   => "Pacific/Tongatapu",
    "Tokelau Is."                  => "Pacific/Fakaofo",
    "Chatham Is."                  => "Pacific/Chatham",
    "Samoa"                        => "Pacific/Apia",
  }

  private UTC_OFFSET_WITH_COLON    = "%s%02d:%02d"                     # :nodoc:
  private UTC_OFFSET_WITHOUT_COLON = UTC_OFFSET_WITH_COLON.tr(":", "") # :nodoc:

  # Returns an array of all `TimeZone` objects. There are multiple
  # `TimeZone` objects per time zone, in many cases, to make it easier
  # for users to find their own time zone.
  def self.all : Array(TimeZone)
    @@zones.empty? ? zones_map.values : @@zones
  end

  def self.find_location(name) : Time::Location
    Time::Location.load(MAPPING[name]? || name)
  end

  private def self.zones_map
    MAPPING.each_with_object({} of String => TimeZone) do |(name, identifier), zones|
      timezone = self.new(name)
      zones[name] = timezone
    end
  end

  # Assumes self represents an offset from UTC in seconds (as returned from
  # `Time#offset`) and turns this into an "+HH:MM" formatted string.
  #
  # ```
  # TimeZone.seconds_to_utc_offset(10800) # => "+03:00"
  # ```
  def self.seconds_to_utc_offset(seconds, colon = true)
    format = colon ? UTC_OFFSET_WITH_COLON : UTC_OFFSET_WITHOUT_COLON
    sign = (seconds < 0 ? "-" : "+")
    hours = seconds.abs / 3600
    minutes = (seconds.abs % 3600) / 60
    format % [sign, hours, minutes]
  end

  include Comparable(self)

  getter name : String
  getter location : Time::Location
  getter utc_offset : Int32

  def initialize(@name : String)
    @location = TimeZone.find_location(name)

    zone = @location.lookup(Time.utc)
    @utc_offset = zone.offset
  end

  # Creates a new `Time` instance representing the current time from the
  # system clock observed in time zone.
  def local : Time
    Time.local(@location)
  end

  # Creates a new `Time` instance representing the given local date-time in time zone.
  def local(year : Int32, month : Int32, day : Int32, hour : Int32 = 0, minute : Int32 = 0, second : Int32 = 0, *, nanosecond : Int32 = 0) : Time
    Time.local(year, month, day, hour, minute, second, nanosecond: nanosecond, location: @location)
  end

  # Compares this `TimeZone` with *other*.
  #
  # The two are compared first on
  # their offsets, and then by name.
  def <=>(other : TimeZone) : Int32
    cmp = (utc_offset <=> other.utc_offset)
    cmp = (name <=> other.name) if cmp.zero?
    cmp
  end

  # Returns a textual representation of this `TimeZone`.
  def to_s
    "(GMT#{formatted_offset}) #{name}"
  end

  # Returns a formatted string of the offset from UTC.
  #
  # ```
  # zone = TimeZone.new("Central Time (US & Canada)")
  # zone.formatted_offset        # => "-06:00"
  # zone.formatted_offset(false) # => "-0600"
  # ```
  def formatted_offset(colon = true) : String
    self.class.seconds_to_utc_offset(utc_offset, colon)
  end
end
