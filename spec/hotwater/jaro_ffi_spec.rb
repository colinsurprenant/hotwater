require 'rspec'
require 'hotwater'

describe Hotwater do

  it "should compute jaro_distance" do
    Hotwater.jaro_distance("", "").should == 0.0
    Hotwater.jaro_distance("dixon", "dicksonx").round(4).should == 0.7667
    Hotwater.jaro_distance("martha", "marhta").round(4).should == 0.9444
    Hotwater.jaro_distance("dwayne", "duane").round(4).should == 0.8222
  end

  it "should compute jaro_winkler_distance" do
    Hotwater.jaro_winkler_distance("", "").should == 0.0
    Hotwater.jaro_winkler_distance("dixon", "dicksonx").round(4).should == 0.8133
    Hotwater.jaro_winkler_distance("martha", "marhta").round(4).should == 0.9611
    Hotwater.jaro_winkler_distance("dwayne", "duane").round(4).should == 0.84
  end
end
