require "./spec_helper"

describe TimeZone do
  it ".new" do
    time_zone = TimeZone.new("Kyiv")
    time_zone.should be_a(TimeZone)
  end

  it ".all" do
    time_zones = TimeZone.all
    time_zones.should be_a(Array(TimeZone))
    time_zones.size.should eq(151)
  end

  it ".find_location" do
    time_zone = TimeZone.find_location("Kyiv")
    time_zone.should be_a(Time::Location)
  end

  describe "instance methods" do
    time_zone = TimeZone.new("Kyiv")

    it "#name" do
      time_zone.name.should eq("Kyiv")
    end

    it "#location" do
      time_zone.location.should be_a(Time::Location)
    end

    it "#offset" do
      time_zone.utc_offset.should eq(10800)
    end

    it "#to_s" do
      time_zone.to_s.should eq("(GMT+03:00) Kyiv")
    end

    it "#formatted_offset" do
      zone = TimeZone.new("Central Time (US & Canada)")

      zone.formatted_offset.should eq("-05:00")
      zone.formatted_offset(false).should eq("-0500")
    end

    it "comparable" do
      zone1 = TimeZone.new("Central Time (US & Canada)")
      zone2 = TimeZone.new("Kyiv")

      (zone2 > zone1).should be_truthy
    end
  end
end
