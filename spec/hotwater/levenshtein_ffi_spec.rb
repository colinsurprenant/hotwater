require 'rspec'
require 'hotwater'

describe Hotwater do

  it "should compute levenshtein_distance" do
    Hotwater.levenshtein_distance("", "").should == 0
    Hotwater.levenshtein_distance("abc", "").should == 3
    Hotwater.levenshtein_distance("bc", "abc").should == 1
    Hotwater.levenshtein_distance("ca", "abc").should == 3
    Hotwater.levenshtein_distance("abc", "acb").should == 2
    Hotwater.levenshtein_distance("kitten", "sitting").should == 3
    Hotwater.levenshtein_distance("Saturday", "Sunday").should == 3
    Hotwater.levenshtein_distance("teusday", "tuesday").should == 2
    Hotwater.levenshtein_distance("teusday", "thursday").should == 2
  end

  it "should compute normalized_levenshtein_distance" do
    Hotwater.normalized_levenshtein_distance("", "").should == 0.0
    Hotwater.normalized_levenshtein_distance("abc", "").should == 0.0
    Hotwater.normalized_levenshtein_distance("bc", "abc").round(4).should == 0.6667
    Hotwater.normalized_levenshtein_distance("ca", "abc").should == 0.0
    Hotwater.normalized_levenshtein_distance("abc", "acb").round(4).should == 0.3333
    Hotwater.normalized_levenshtein_distance("kitten", "sitting").round(4).should == 0.5714
    Hotwater.normalized_levenshtein_distance("Saturday", "Sunday").round(4).should == 0.625
    Hotwater.normalized_levenshtein_distance("teusday", "tuesday").round(4).should == 0.7143
    Hotwater.normalized_levenshtein_distance("teusday", "thursday").round(4).should == 0.75

    Hotwater.normalized_levenshtein_distance("aaaa", "aaab").round(4).should == 0.75
    Hotwater.normalized_levenshtein_distance("aaaaa", "aaaab").round(4).should == 0.8
    Hotwater.normalized_levenshtein_distance("aaaaaa", "aaaaab").round(4).should == 0.8333
  end
end
