require "./spec_helper"

describe TimeZone do
  it "version" do
    TimeZone::VERSION.should_not be_nil
  end

  it ".new" do
    time_zone = TimeZone.new("Taipei")
    time_zone.should be_a(TimeZone)
  end

  it ".all" do
    time_zones = TimeZone.all
    time_zones.should be_a(Array(TimeZone))
    time_zones.size.should eq(151)
  end

  it ".find_location" do
    time_zone = TimeZone.find_location("Taipei")
    time_zone.should be_a(Time::Location)
  end

  describe "instance methods" do
    time_zone = TimeZone.new("Taipei")

    it "#name" do
      time_zone.name.should eq("Taipei")
    end

    it "#location" do
      time_zone.location.should be_a(Time::Location)
    end

    it "#offset" do
      time_zone.utc_offset.should eq(28800)
    end

    it "#to_s" do
      time_zone.to_s.should eq("(GMT+08:00) Taipei")
    end

    it "#inspect" do
      time_zone.inspect.should match(/#<TimeZone:0x[0-9a-f]+ @name=\"Taipei\", @location=#<Time::Location Asia\/Taipei>, @utc_offset=\d+>/)
    end

    it "#formatted_offset" do
      zone = TimeZone.new("Taipei")

      zone.formatted_offset.should eq("+08:00")
      zone.formatted_offset(false).should eq("+0800")
    end

    it "comparable" do
      zone1 = TimeZone.new("Central Time (US & Canada)")
      zone2 = TimeZone.new("Taipei")

      (zone2 > zone1).should be_truthy
    end

    context "#local" do
      it "returns current time in time zone" do
        time = time_zone.local
        time.should be_a(Time)
      end

      it "returns time in time zone" do
        time = time_zone.local(2022, 2, 24)
        time.should be_a(Time)
      end
    end
  end
end
